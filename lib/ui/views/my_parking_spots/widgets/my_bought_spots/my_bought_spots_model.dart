import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class MyBoughtSpotsModel extends BaseViewModel {
  final _logger = getLogger('MyBoughtSpotsModel');
  final _reservationsService = locator<ReservationsService>();
  final _toastService = locator<ToastService>();

  List<Reservation> _boughtSpots = [];
  List<Reservation> get boughtSpots => _boughtSpots;

  Future<void> getBoughtSpots({DateTime? from, DateTime? to}) async {
    setError(null);
    setBusy(true);
    try {
      final response = await _reservationsService.getReservations(
        from: from,
        to: to,
      );
      await response.match(
        (error) async {
          _logger.e('Error fetching bought spots', error: error);
          setError(error);
        },
        (allReservations) async {
          _boughtSpots = allReservations;
          rebuildUi();
        },
      );
    } finally {
      setBusy(false);
    }
  }

  Future<void> onRefresh({DateTime? from, DateTime? to}) async {
    setError(null);
    final response = await _reservationsService.getReservations(
      from: from,
      to: to,
    );
    await response.match(
      (error) async {
        _logger.e('Error refreshing bought spots', error: error);
        _toastService.showError(
          title: CommonStrings.unableToRefresh,
          description: error,
          showIcon: true,
        );
      },
      (allReservations) async {
        _boughtSpots = allReservations;
        rebuildUi();
      },
    );
  }
}

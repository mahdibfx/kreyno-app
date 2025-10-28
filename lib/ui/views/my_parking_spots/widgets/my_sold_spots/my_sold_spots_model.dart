import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/services/parking_spots_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class MySoldSpotsModel extends BaseViewModel {
  final _logger = getLogger('MySoldSpotsModel');
  final _parkingSpotsService = locator<ParkingSpotsService>();
  final _toastService = locator<ToastService>();

  List<ParkingSpot> _soldSpots = [];
  List<ParkingSpot> get soldSpots => _soldSpots;

  Future<void> getSoldSpots({DateTime? from, DateTime? to}) async {
    setError(null);
    setBusy(true);
    try {
      final response = await _parkingSpotsService.getParkingSpots(
        from: from,
        to: to,
      );
      await response.match(
        (error) async {
          _logger.e('Error fetching sold spots', error: error);
          setError(error);
        },
        (allSpots) async {
          _soldSpots = allSpots;
          rebuildUi();
        },
      );
    } finally {
      setBusy(false);
    }
  }

  Future<void> onRefresh() async {
    setError(null);
    final response = await _parkingSpotsService.getParkingSpots();
    await response.match(
      (error) async {
        _logger.e('Error refreshing sold spots', error: error);
        _toastService.showError(
          title: CommonStrings.unableToRefresh,
          description: error,
          showIcon: true,
        );
      },
      (allSpots) async {
        _soldSpots = allSpots;
        rebuildUi();
      },
    );
  }
}

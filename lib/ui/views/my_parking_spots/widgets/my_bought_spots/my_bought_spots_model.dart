import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/models/parking_spot.dart';
import 'package:kreyno/models/reservation.dart';
import 'package:kreyno/services/parking_spots_service.dart';
import 'package:kreyno/services/reservations_service.dart';
import 'package:kreyno/services/toast_service.dart';
import 'package:kreyno/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class MyBoughtSpotsModel extends BaseViewModel {
  final _logger = getLogger('MyBoughtSpotsModel');
  final _reservationsService = locator<ReservationsService>();
  final _parkingSpotsService = locator<ParkingSpotsService>();

  final _toastService = locator<ToastService>();

  List<Reservation> _boughtSpots = [];
  List<Reservation> get boughtSpots => _boughtSpots;

  int _currentPage = 0;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> getBoughtSpots({DateTime? from, DateTime? to}) async {
    _currentPage = 0;
    _hasMore = true;
    _boughtSpots.clear();
    setError(null);
    setBusy(true);
    try {
      final response = await _reservationsService.getReservations(
        from: from,
        to: to,
        page: _currentPage,
      );
      await response.match(
        (error) async {
          _logger.e('Error fetching bought spots', error: error);
          setError(error);
        },
        (paginatedList) async {
          _boughtSpots = paginatedList.items;
          _hasMore = paginatedList.meta.hasMore;
          if (_hasMore) {
            _currentPage++;
          }
          rebuildUi();
        },
      );
    } finally {
      setBusy(false);
    }
  }

  Future<void> loadMoreBoughtSpots({DateTime? from, DateTime? to}) async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    rebuildUi();

    final response = await _reservationsService.getReservations(
      from: from,
      to: to,
      page: _currentPage,
    );

    await response.match(
      (error) async {
        _logger.e('Error loading more bought spots', error: error);
        _toastService.showError(
          title: CommonStrings.error,
          description: error,
          showIcon: true,
        );
      },
      (paginatedList) async {
        _boughtSpots.addAll(paginatedList.items);
        _hasMore = paginatedList.meta.hasMore;
        if (_hasMore) {
          _currentPage++;
        }
        rebuildUi();
      },
    );

    _isLoadingMore = false;
    rebuildUi();
  }

  Future<void> onRefresh({DateTime? from, DateTime? to}) async {
    await getBoughtSpots(from: from, to: to);
  }
}

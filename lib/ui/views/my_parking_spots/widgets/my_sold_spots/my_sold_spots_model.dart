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

  int _currentPage = 0;
  bool _hasMore = true;
  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> getSoldSpots({DateTime? from, DateTime? to}) async {
    _currentPage = 0;
    _hasMore = true;
    _soldSpots.clear();
    setError(null);
    setBusy(true);
    try {
      final response = await _parkingSpotsService.getParkingSpots(
        from: from,
        to: to,
        page: _currentPage,
      );
      await response.match(
        (error) async {
          _logger.e('Error fetching sold spots', error: error);
          setError(error);
        },
        (paginatedList) async {
          _soldSpots = paginatedList.items;
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

  Future<void> loadMoreSoldSpots({DateTime? from, DateTime? to}) async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    rebuildUi();

    final response = await _parkingSpotsService.getParkingSpots(
      from: from,
      to: to,
      page: _currentPage,
    );

    await response.match(
      (error) async {
        _logger.e('Error loading more sold spots', error: error);
        _toastService.showError(
          title: CommonStrings.error,
          description: error,
          showIcon: true,
        );
      },
      (paginatedList) async {
        _soldSpots.addAll(paginatedList.items);
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
    await getSoldSpots(from: from, to: to);
  }
}

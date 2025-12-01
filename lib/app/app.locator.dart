// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/api/dio_service.dart';
import '../services/auth_service.dart';
import '../services/cars_service.dart';
import '../services/chat_service.dart';
import '../services/device_service.dart';
import '../services/google_map_service.dart';
import '../services/location_service.dart';
import '../services/media_service.dart';
import '../services/onboarding_service.dart';
import '../services/parking_spots_service.dart';
import '../services/permissions_service.dart';
import '../services/picked_language_service.dart';
import '../services/reservations_service.dart';
import '../services/shared_prefs_service.dart';
import '../services/stripe_service.dart';
import '../services/toast_service.dart';
import '../services/tracking_service.dart';
import '../services/url_launcher_service.dart';
import '../services/user_service.dart';
import '../services/wallet_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
  // Register environments
  locator.registerEnvironment(
    environment: environment,
    environmentFilter: environmentFilter,
  );

  // Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SharedPrefsService());
  locator.registerSingleton(DioService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => ToastService());
  locator.registerLazySingleton(() => DeviceService());
  locator.registerLazySingleton(() => OnboardingService());
  locator.registerLazySingleton(() => PickedLanguageService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => CarsService());
  locator.registerLazySingleton(() => MediaService());
  locator.registerLazySingleton(() => StripeService());
  locator.registerLazySingleton(() => PermissionsService());
  locator.registerLazySingleton(() => ParkingSpotsService());
  locator.registerLazySingleton(() => ReservationsService());
  locator.registerLazySingleton(() => WalletService());
  locator.registerLazySingleton(() => UrlLauncherService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerFactory(() => GoogleMapService());
  locator.registerLazySingleton(() => TrackingService());
  locator.registerLazySingleton(() => ChatService());
}

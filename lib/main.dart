import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.dialogs.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/firebase_options.dart';
import 'package:kreyno/services/app_bottom_sheet_service.dart';
import 'package:kreyno/ui/common/responsive_sizer.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toastification/toastification.dart';

Future<void> _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Stripe
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';

  await setupLocator();
  // Replace stacked's GetX-based BottomSheetService with a native one so that
  // sheets stay responsive after navigating to a screen and coming back.
  // Must run before setupBottomSheetUi() so the sheet builders are registered
  // on the replacement instance.
  if (locator.isRegistered<BottomSheetService>()) {
    locator.unregister<BottomSheetService>();
  }
  locator.registerLazySingleton<BottomSheetService>(
    () => AppBottomSheetService(),
  );
  setupDialogUi();
  setupBottomSheetUi();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Future<void> main() async {
  await _initApp();
  runApp(
    EasyLocalization(
      startLocale: const Locale('fr', 'FR'),
      supportedLocales: const [Locale('fr', 'FR'), Locale('en', 'US')],
      path: 'assets/translations',
      saveLocale: true,
      fallbackLocale: const Locale('fr', 'FR'),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizerWidget(
      child: ToastificationWrapper(
        child: MaterialApp(
          restorationScopeId: "app-restoration-kreyno",

          debugShowCheckedModeBanner: false,
          initialRoute: Routes.startupView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [StackedService.routeObserver],
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}

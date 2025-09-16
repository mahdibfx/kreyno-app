import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kreyno/app/app.bottomsheets.dart';
import 'package:kreyno/app/app.dialogs.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.router.dart';
import 'package:kreyno/ui/common/responsive_sizer.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await setupLocator();
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
      child: MaterialApp(
        initialRoute: Routes.homeView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [StackedService.routeObserver],
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i25;
import 'package:flutter/material.dart';
import 'package:kreyno/ui/views/add_vehicule/add_vehicule_view.dart' as _i20;
import 'package:kreyno/ui/views/buyer_spot_details/buyer_spot_details_view.dart'
    as _i11;
import 'package:kreyno/ui/views/cashout/cashout_view.dart' as _i19;
import 'package:kreyno/ui/views/checkout_money/checkout_money_view.dart'
    as _i24;
import 'package:kreyno/ui/views/edit_profile/edit_profile_view.dart' as _i14;
import 'package:kreyno/ui/views/edit_vehicule/edit_vehicule_view.dart' as _i21;
import 'package:kreyno/ui/views/home/home_view.dart' as _i2;
import 'package:kreyno/ui/views/kreyno_wallet/kreyno_wallet_view.dart' as _i18;
import 'package:kreyno/ui/views/kreyono_portfolio/kreyono_portfolio_view.dart'
    as _i23;
import 'package:kreyno/ui/views/my_payment_methodes/my_payment_methodes_view.dart'
    as _i16;
import 'package:kreyno/ui/views/my_stationements/my_stationements_view.dart'
    as _i22;
import 'package:kreyno/ui/views/my_vehicules/my_vehicules_view.dart' as _i15;
import 'package:kreyno/ui/views/onboarding/onboarding_view.dart' as _i4;
import 'package:kreyno/ui/views/seller_spot_details/seller_spot_details_view.dart'
    as _i10;
import 'package:kreyno/ui/views/set_up_payment_methods/set_up_payment_methods_view.dart'
    as _i8;
import 'package:kreyno/ui/views/set_up_permissions/set_up_permissions_view.dart'
    as _i9;
import 'package:kreyno/ui/views/set_up_vehicule/set_up_vehicule_view.dart'
    as _i7;
import 'package:kreyno/ui/views/signin/signin_view.dart' as _i5;
import 'package:kreyno/ui/views/signup/signup_view.dart' as _i6;
import 'package:kreyno/ui/views/spot_bought_success/spot_bought_success_view.dart'
    as _i13;
import 'package:kreyno/ui/views/spot_sold_success/spot_sold_success_view.dart'
    as _i12;
import 'package:kreyno/ui/views/spots_history/spots_history_view.dart' as _i17;
import 'package:kreyno/ui/views/startup/startup_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i26;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const onboardingView = '/onboarding-view';

  static const signinView = '/signin-view';

  static const signupView = '/signup-view';

  static const setUpVehiculeView = '/set-up-vehicule-view';

  static const setUpPaymentMethodsView = '/set-up-payment-methods-view';

  static const setUpPermissionsView = '/set-up-permissions-view';

  static const sellerSpotDetailsView = '/seller-spot-details-view';

  static const buyerSpotDetailsView = '/buyer-spot-details-view';

  static const spotSoldSuccessView = '/spot-sold-success-view';

  static const spotBoughtSuccessView = '/spot-bought-success-view';

  static const editProfileView = '/edit-profile-view';

  static const myVehiculesView = '/my-vehicules-view';

  static const myPaymentMethodesView = '/my-payment-methodes-view';

  static const spotsHistoryView = '/spots-history-view';

  static const kreynoWalletView = '/kreyno-wallet-view';

  static const cashoutView = '/cashout-view';

  static const addVehiculeView = '/add-vehicule-view';

  static const editVehiculeView = '/edit-vehicule-view';

  static const myStationementsView = '/my-stationements-view';

  static const kreyonoPortfolioView = '/kreyono-portfolio-view';

  static const checkoutMoneyView = '/checkout-money-view';

  static const addVehiculeView = '/add-vehicule-view';

  static const all = <String>{
    homeView,
    startupView,
    onboardingView,
    signinView,
    signupView,
    setUpVehiculeView,
    setUpPaymentMethodsView,
    setUpPermissionsView,
    sellerSpotDetailsView,
    buyerSpotDetailsView,
    spotSoldSuccessView,
    spotBoughtSuccessView,
    editProfileView,
    myVehiculesView,
    myPaymentMethodesView,
    spotsHistoryView,
    kreynoWalletView,
    cashoutView,
    addVehiculeView,
    editVehiculeView,
    myStationementsView,
    kreyonoPortfolioView,
    checkoutMoneyView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i4.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.signinView,
      page: _i5.SigninView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i6.SignupView,
    ),
    _i1.RouteDef(
      Routes.setUpVehiculeView,
      page: _i7.SetUpVehiculeView,
    ),
    _i1.RouteDef(
      Routes.setUpPaymentMethodsView,
      page: _i8.SetUpPaymentMethodsView,
    ),
    _i1.RouteDef(
      Routes.setUpPermissionsView,
      page: _i9.SetUpPermissionsView,
    ),
    _i1.RouteDef(
      Routes.sellerSpotDetailsView,
      page: _i10.SellerSpotDetailsView,
    ),
    _i1.RouteDef(
      Routes.buyerSpotDetailsView,
      page: _i11.BuyerSpotDetailsView,
    ),
    _i1.RouteDef(
      Routes.spotSoldSuccessView,
      page: _i12.SpotSoldSuccessView,
    ),
    _i1.RouteDef(
      Routes.spotBoughtSuccessView,
      page: _i13.SpotBoughtSuccessView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: _i14.EditProfileView,
    ),
    _i1.RouteDef(
      Routes.myVehiculesView,
      page: _i15.MyVehiculesView,
    ),
    _i1.RouteDef(
      Routes.myPaymentMethodesView,
      page: _i16.MyPaymentMethodesView,
    ),
    _i1.RouteDef(
      Routes.spotsHistoryView,
      page: _i17.SpotsHistoryView,
    ),
    _i1.RouteDef(
      Routes.kreynoWalletView,
      page: _i18.KreynoWalletView,
    ),
    _i1.RouteDef(
      Routes.cashoutView,
      page: _i19.CashoutView,
    ),
    _i1.RouteDef(
      Routes.addVehiculeView,
      page: _i20.AddVehiculeView,
    ),
    _i1.RouteDef(
      Routes.editVehiculeView,
      page: _i21.EditVehiculeView,
    ),
    _i1.RouteDef(
      Routes.myStationementsView,
      page: _i22.MyStationementsView,
    ),
    _i1.RouteDef(
      Routes.kreyonoPortfolioView,
      page: _i23.KreyonoPortfolioView,
    ),
    _i1.RouteDef(
      Routes.checkoutMoneyView,
      page: _i24.CheckoutMoneyView,
    ),
    _i1.RouteDef(
      Routes.addVehiculeView,
      page: _i20.AddVehiculeView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.OnboardingView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.OnboardingView(),
        settings: data,
      );
    },
    _i5.SigninView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SigninView(),
        settings: data,
      );
    },
    _i6.SignupView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.SignupView(),
        settings: data,
      );
    },
    _i7.SetUpVehiculeView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.SetUpVehiculeView(),
        settings: data,
      );
    },
    _i8.SetUpPaymentMethodsView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.SetUpPaymentMethodsView(),
        settings: data,
      );
    },
    _i9.SetUpPermissionsView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.SetUpPermissionsView(),
        settings: data,
      );
    },
    _i10.SellerSpotDetailsView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.SellerSpotDetailsView(),
        settings: data,
      );
    },
    _i11.BuyerSpotDetailsView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.BuyerSpotDetailsView(),
        settings: data,
      );
    },
    _i12.SpotSoldSuccessView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.SpotSoldSuccessView(),
        settings: data,
      );
    },
    _i13.SpotBoughtSuccessView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.SpotBoughtSuccessView(),
        settings: data,
      );
    },
    _i14.EditProfileView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.EditProfileView(),
        settings: data,
      );
    },
    _i15.MyVehiculesView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.MyVehiculesView(),
        settings: data,
      );
    },
    _i16.MyPaymentMethodesView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.MyPaymentMethodesView(),
        settings: data,
      );
    },
    _i17.SpotsHistoryView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.SpotsHistoryView(),
        settings: data,
      );
    },
    _i18.KreynoWalletView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.KreynoWalletView(),
        settings: data,
      );
    },
    _i19.CashoutView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.CashoutView(),
        settings: data,
      );
    },
    _i20.AddVehiculeView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.AddVehiculeView(),
        settings: data,
      );
    },
    _i21.EditVehiculeView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.EditVehiculeView(),
        settings: data,
      );
    },
    _i22.MyStationementsView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.MyStationementsView(),
        settings: data,
      );
    },
    _i23.KreyonoPortfolioView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.KreyonoPortfolioView(),
        settings: data,
      );
    },
    _i24.CheckoutMoneyView: (data) {
      return _i25.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.CheckoutMoneyView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i26.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSigninView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSetUpVehiculeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.setUpVehiculeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSetUpPaymentMethodsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.setUpPaymentMethodsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSetUpPermissionsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.setUpPermissionsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSellerSpotDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sellerSpotDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyerSpotDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buyerSpotDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSpotSoldSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.spotSoldSuccessView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSpotBoughtSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.spotBoughtSuccessView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyVehiculesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myVehiculesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyPaymentMethodesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myPaymentMethodesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSpotsHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.spotsHistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKreynoWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kreynoWalletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCashoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cashoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddVehiculeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addVehiculeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditVehiculeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editVehiculeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyStationementsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myStationementsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKreyonoPortfolioView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kreyonoPortfolioView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCheckoutMoneyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.checkoutMoneyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddVehiculeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addVehiculeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSigninView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSetUpVehiculeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.setUpVehiculeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSetUpPaymentMethodsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.setUpPaymentMethodsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSetUpPermissionsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.setUpPermissionsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSellerSpotDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sellerSpotDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyerSpotDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buyerSpotDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSpotSoldSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.spotSoldSuccessView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSpotBoughtSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.spotBoughtSuccessView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyVehiculesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myVehiculesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyPaymentMethodesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myPaymentMethodesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSpotsHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.spotsHistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKreynoWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.kreynoWalletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCashoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cashoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddVehiculeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addVehiculeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditVehiculeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editVehiculeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyStationementsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myStationementsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKreyonoPortfolioView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.kreyonoPortfolioView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCheckoutMoneyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.checkoutMoneyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddVehiculeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addVehiculeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i36;
import 'package:flutter/material.dart';
import 'package:kreyno/models/parking_spot.dart' as _i38;
import 'package:kreyno/models/reservation.dart' as _i39;
import 'package:kreyno/models/wallet.dart' as _i37;
import 'package:kreyno/ui/views/account_settings/account_settings_view.dart'
    as _i25;
import 'package:kreyno/ui/views/add_bank_account/add_bank_account_view.dart'
    as _i29;
import 'package:kreyno/ui/views/add_vehicule/add_vehicule_view.dart' as _i24;
import 'package:kreyno/ui/views/buyer_spot_details/buyer_spot_details_view.dart'
    as _i11;
import 'package:kreyno/ui/views/cashout/cashout_view.dart' as _i19;
import 'package:kreyno/ui/views/change_language/change_language_view.dart'
    as _i26;
import 'package:kreyno/ui/views/change_phone_number/change_phone_number_view.dart'
    as _i27;
import 'package:kreyno/ui/views/chat/chat_view.dart' as _i35;
import 'package:kreyno/ui/views/checkout_money/checkout_money_view.dart'
    as _i23;
import 'package:kreyno/ui/views/choose_selling_place_location/choose_selling_place_location_view.dart'
    as _i31;
import 'package:kreyno/ui/views/client_tracking/client_tracking_view.dart'
    as _i33;
import 'package:kreyno/ui/views/edit_profile/edit_profile_view.dart' as _i14;
import 'package:kreyno/ui/views/edit_vehicule/edit_vehicule_view.dart' as _i20;
import 'package:kreyno/ui/views/home/home_view.dart' as _i2;
import 'package:kreyno/ui/views/kreyno_wallet/kreyno_wallet_view.dart' as _i18;
import 'package:kreyno/ui/views/kreyono_portfolio/kreyono_portfolio_view.dart'
    as _i22;
import 'package:kreyno/ui/views/my_let_place/my_let_place_view.dart' as _i32;
import 'package:kreyno/ui/views/my_parking_spots/my_parking_spots_view.dart'
    as _i28;
import 'package:kreyno/ui/views/my_payment_methodes/my_payment_methodes_view.dart'
    as _i16;
import 'package:kreyno/ui/views/my_vehicules/my_vehicules_view.dart' as _i15;
import 'package:kreyno/ui/views/onboarding/onboarding_view.dart' as _i4;
import 'package:kreyno/ui/views/payout/payout_view.dart' as _i30;
import 'package:kreyno/ui/views/seller_spot_details/seller_spot_details_view.dart'
    as _i10;
import 'package:kreyno/ui/views/seller_tracking/seller_tracking_view.dart'
    as _i34;
import 'package:kreyno/ui/views/set_up_language/set_up_language_view.dart'
    as _i21;
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
import 'package:stacked_services/stacked_services.dart' as _i40;

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

  static const editVehiculeView = '/edit-vehicule-view';

  static const setUpLanguageView = '/set-up-language-view';

  static const kreyonoPortfolioView = '/kreyono-portfolio-view';

  static const checkoutMoneyView = '/checkout-money-view';

  static const addVehiculeView = '/add-vehicule-view';

  static const accountSettingsView = '/account-settings-view';

  static const changeLanguageView = '/change-language-view';

  static const changePhoneNumberView = '/change-phone-number-view';

  static const myParkingSpotsView = '/my-parking-spots-view';

  static const addBankAccountView = '/add-bank-account-view';

  static const payoutView = '/payout-view';

  static const chooseSellingPlaceLocationView =
      '/choose-selling-place-location-view';

  static const myLetPlaceView = '/my-let-place-view';

  static const clientTrackingView = '/client-tracking-view';

  static const sellerTrackingView = '/seller-tracking-view';

  static const chatView = '/chat-view';

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
    editVehiculeView,
    setUpLanguageView,
    kreyonoPortfolioView,
    checkoutMoneyView,
    addVehiculeView,
    accountSettingsView,
    changeLanguageView,
    changePhoneNumberView,
    myParkingSpotsView,
    addBankAccountView,
    payoutView,
    chooseSellingPlaceLocationView,
    myLetPlaceView,
    clientTrackingView,
    sellerTrackingView,
    chatView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.homeView, page: _i2.HomeView),
    _i1.RouteDef(Routes.startupView, page: _i3.StartupView),
    _i1.RouteDef(Routes.onboardingView, page: _i4.OnboardingView),
    _i1.RouteDef(Routes.signinView, page: _i5.SigninView),
    _i1.RouteDef(Routes.signupView, page: _i6.SignupView),
    _i1.RouteDef(Routes.setUpVehiculeView, page: _i7.SetUpVehiculeView),
    _i1.RouteDef(
      Routes.setUpPaymentMethodsView,
      page: _i8.SetUpPaymentMethodsView,
    ),
    _i1.RouteDef(Routes.setUpPermissionsView, page: _i9.SetUpPermissionsView),
    _i1.RouteDef(
      Routes.sellerSpotDetailsView,
      page: _i10.SellerSpotDetailsView,
    ),
    _i1.RouteDef(Routes.buyerSpotDetailsView, page: _i11.BuyerSpotDetailsView),
    _i1.RouteDef(Routes.spotSoldSuccessView, page: _i12.SpotSoldSuccessView),
    _i1.RouteDef(
      Routes.spotBoughtSuccessView,
      page: _i13.SpotBoughtSuccessView,
    ),
    _i1.RouteDef(Routes.editProfileView, page: _i14.EditProfileView),
    _i1.RouteDef(Routes.myVehiculesView, page: _i15.MyVehiculesView),
    _i1.RouteDef(
      Routes.myPaymentMethodesView,
      page: _i16.MyPaymentMethodesView,
    ),
    _i1.RouteDef(Routes.spotsHistoryView, page: _i17.SpotsHistoryView),
    _i1.RouteDef(Routes.kreynoWalletView, page: _i18.KreynoWalletView),
    _i1.RouteDef(Routes.cashoutView, page: _i19.CashoutView),
    _i1.RouteDef(Routes.editVehiculeView, page: _i20.EditVehiculeView),
    _i1.RouteDef(Routes.setUpLanguageView, page: _i21.SetUpLanguageView),
    _i1.RouteDef(Routes.kreyonoPortfolioView, page: _i22.KreyonoPortfolioView),
    _i1.RouteDef(Routes.checkoutMoneyView, page: _i23.CheckoutMoneyView),
    _i1.RouteDef(Routes.addVehiculeView, page: _i24.AddVehiculeView),
    _i1.RouteDef(Routes.accountSettingsView, page: _i25.AccountSettingsView),
    _i1.RouteDef(Routes.changeLanguageView, page: _i26.ChangeLanguageView),
    _i1.RouteDef(
      Routes.changePhoneNumberView,
      page: _i27.ChangePhoneNumberView,
    ),
    _i1.RouteDef(Routes.myParkingSpotsView, page: _i28.MyParkingSpotsView),
    _i1.RouteDef(Routes.addBankAccountView, page: _i29.AddBankAccountView),
    _i1.RouteDef(Routes.payoutView, page: _i30.PayoutView),
    _i1.RouteDef(
      Routes.chooseSellingPlaceLocationView,
      page: _i31.ChooseSellingPlaceLocationView,
    ),
    _i1.RouteDef(Routes.myLetPlaceView, page: _i32.MyLetPlaceView),
    _i1.RouteDef(Routes.clientTrackingView, page: _i33.ClientTrackingView),
    _i1.RouteDef(Routes.sellerTrackingView, page: _i34.SellerTrackingView),
    _i1.RouteDef(Routes.chatView, page: _i35.ChatView),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(
        orElse: () => const HomeViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(key: args.key),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      final args = data.getArgs<StartupViewArguments>(
        orElse: () => const StartupViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.StartupView(key: args.key),
        settings: data,
      );
    },
    _i4.OnboardingView: (data) {
      final args = data.getArgs<OnboardingViewArguments>(
        orElse: () => const OnboardingViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.OnboardingView(key: args.key),
        settings: data,
      );
    },
    _i5.SigninView: (data) {
      final args = data.getArgs<SigninViewArguments>(
        orElse: () => const SigninViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.SigninView(key: args.key),
        settings: data,
      );
    },
    _i6.SignupView: (data) {
      final args = data.getArgs<SignupViewArguments>(nullOk: false);
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.SignupView(key: args.key, phoneNumber: args.phoneNumber),
        settings: data,
      );
    },
    _i7.SetUpVehiculeView: (data) {
      final args = data.getArgs<SetUpVehiculeViewArguments>(
        orElse: () => const SetUpVehiculeViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.SetUpVehiculeView(key: args.key),
        settings: data,
      );
    },
    _i8.SetUpPaymentMethodsView: (data) {
      final args = data.getArgs<SetUpPaymentMethodsViewArguments>(
        orElse: () => const SetUpPaymentMethodsViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.SetUpPaymentMethodsView(key: args.key),
        settings: data,
      );
    },
    _i9.SetUpPermissionsView: (data) {
      final args = data.getArgs<SetUpPermissionsViewArguments>(
        orElse: () => const SetUpPermissionsViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.SetUpPermissionsView(key: args.key),
        settings: data,
      );
    },
    _i10.SellerSpotDetailsView: (data) {
      final args = data.getArgs<SellerSpotDetailsViewArguments>(
        orElse: () => const SellerSpotDetailsViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.SellerSpotDetailsView(key: args.key),
        settings: data,
      );
    },
    _i11.BuyerSpotDetailsView: (data) {
      final args = data.getArgs<BuyerSpotDetailsViewArguments>(
        orElse: () => const BuyerSpotDetailsViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.BuyerSpotDetailsView(key: args.key),
        settings: data,
      );
    },
    _i12.SpotSoldSuccessView: (data) {
      final args = data.getArgs<SpotSoldSuccessViewArguments>(
        orElse: () => const SpotSoldSuccessViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.SpotSoldSuccessView(key: args.key),
        settings: data,
      );
    },
    _i13.SpotBoughtSuccessView: (data) {
      final args = data.getArgs<SpotBoughtSuccessViewArguments>(
        orElse: () => const SpotBoughtSuccessViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i13.SpotBoughtSuccessView(key: args.key),
        settings: data,
      );
    },
    _i14.EditProfileView: (data) {
      final args = data.getArgs<EditProfileViewArguments>(
        orElse: () => const EditProfileViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.EditProfileView(key: args.key),
        settings: data,
      );
    },
    _i15.MyVehiculesView: (data) {
      final args = data.getArgs<MyVehiculesViewArguments>(
        orElse: () => const MyVehiculesViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.MyVehiculesView(key: args.key),
        settings: data,
      );
    },
    _i16.MyPaymentMethodesView: (data) {
      final args = data.getArgs<MyPaymentMethodesViewArguments>(
        orElse: () => const MyPaymentMethodesViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i16.MyPaymentMethodesView(key: args.key),
        settings: data,
      );
    },
    _i17.SpotsHistoryView: (data) {
      final args = data.getArgs<SpotsHistoryViewArguments>(
        orElse: () => const SpotsHistoryViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i17.SpotsHistoryView(key: args.key),
        settings: data,
      );
    },
    _i18.KreynoWalletView: (data) {
      final args = data.getArgs<KreynoWalletViewArguments>(
        orElse: () => const KreynoWalletViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i18.KreynoWalletView(key: args.key),
        settings: data,
      );
    },
    _i19.CashoutView: (data) {
      final args = data.getArgs<CashoutViewArguments>(
        orElse: () => const CashoutViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i19.CashoutView(key: args.key),
        settings: data,
      );
    },
    _i20.EditVehiculeView: (data) {
      final args = data.getArgs<EditVehiculeViewArguments>(
        orElse: () => const EditVehiculeViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i20.EditVehiculeView(key: args.key),
        settings: data,
      );
    },
    _i21.SetUpLanguageView: (data) {
      final args = data.getArgs<SetUpLanguageViewArguments>(
        orElse: () => const SetUpLanguageViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.SetUpLanguageView(key: args.key),
        settings: data,
      );
    },
    _i22.KreyonoPortfolioView: (data) {
      final args = data.getArgs<KreyonoPortfolioViewArguments>(
        orElse: () => const KreyonoPortfolioViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i22.KreyonoPortfolioView(key: args.key),
        settings: data,
      );
    },
    _i23.CheckoutMoneyView: (data) {
      final args = data.getArgs<CheckoutMoneyViewArguments>(
        orElse: () => const CheckoutMoneyViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i23.CheckoutMoneyView(key: args.key),
        settings: data,
      );
    },
    _i24.AddVehiculeView: (data) {
      final args = data.getArgs<AddVehiculeViewArguments>(
        orElse: () => const AddVehiculeViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i24.AddVehiculeView(key: args.key),
        settings: data,
      );
    },
    _i25.AccountSettingsView: (data) {
      final args = data.getArgs<AccountSettingsViewArguments>(
        orElse: () => const AccountSettingsViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i25.AccountSettingsView(key: args.key),
        settings: data,
      );
    },
    _i26.ChangeLanguageView: (data) {
      final args = data.getArgs<ChangeLanguageViewArguments>(
        orElse: () => const ChangeLanguageViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i26.ChangeLanguageView(key: args.key),
        settings: data,
      );
    },
    _i27.ChangePhoneNumberView: (data) {
      final args = data.getArgs<ChangePhoneNumberViewArguments>(
        orElse: () => const ChangePhoneNumberViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i27.ChangePhoneNumberView(key: args.key),
        settings: data,
      );
    },
    _i28.MyParkingSpotsView: (data) {
      final args = data.getArgs<MyParkingSpotsViewArguments>(
        orElse: () => const MyParkingSpotsViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i28.MyParkingSpotsView(key: args.key),
        settings: data,
      );
    },
    _i29.AddBankAccountView: (data) {
      final args = data.getArgs<AddBankAccountViewArguments>(
        orElse: () => const AddBankAccountViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i29.AddBankAccountView(key: args.key),
        settings: data,
      );
    },
    _i30.PayoutView: (data) {
      final args = data.getArgs<PayoutViewArguments>(nullOk: false);
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i30.PayoutView(key: args.key, wallet: args.wallet),
        settings: data,
      );
    },
    _i31.ChooseSellingPlaceLocationView: (data) {
      final args = data.getArgs<ChooseSellingPlaceLocationViewArguments>(
        orElse: () => const ChooseSellingPlaceLocationViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i31.ChooseSellingPlaceLocationView(key: args.key),
        settings: data,
      );
    },
    _i32.MyLetPlaceView: (data) {
      final args = data.getArgs<MyLetPlaceViewArguments>(
        orElse: () => const MyLetPlaceViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i32.MyLetPlaceView(key: args.key),
        settings: data,
      );
    },
    _i33.ClientTrackingView: (data) {
      final args = data.getArgs<ClientTrackingViewArguments>(nullOk: false);
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i33.ClientTrackingView(
          key: args.key,
          parkingSpot: args.parkingSpot,
          reservation: args.reservation,
        ),
        settings: data,
      );
    },
    _i34.SellerTrackingView: (data) {
      final args = data.getArgs<SellerTrackingViewArguments>(nullOk: false);
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i34.SellerTrackingView(
          key: args.key,
          reservation: args.reservation,
        ),
        settings: data,
      );
    },
    _i35.ChatView: (data) {
      final args = data.getArgs<ChatViewArguments>(
        orElse: () => const ChatViewArguments(),
      );
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i35.ChatView(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class StartupViewArguments {
  const StartupViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant StartupViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class OnboardingViewArguments {
  const OnboardingViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant OnboardingViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SigninViewArguments {
  const SigninViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SigninViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SignupViewArguments {
  const SignupViewArguments({this.key, required this.phoneNumber});

  final _i36.Key? key;

  final ({String countryCode, String countryDialCode, String phoneNumber})
  phoneNumber;

  @override
  String toString() {
    return '{"key": "$key", "phoneNumber": "$phoneNumber"}';
  }

  @override
  bool operator ==(covariant SignupViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return key.hashCode ^ phoneNumber.hashCode;
  }
}

class SetUpVehiculeViewArguments {
  const SetUpVehiculeViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SetUpVehiculeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SetUpPaymentMethodsViewArguments {
  const SetUpPaymentMethodsViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SetUpPaymentMethodsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SetUpPermissionsViewArguments {
  const SetUpPermissionsViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SetUpPermissionsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SellerSpotDetailsViewArguments {
  const SellerSpotDetailsViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SellerSpotDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class BuyerSpotDetailsViewArguments {
  const BuyerSpotDetailsViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant BuyerSpotDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SpotSoldSuccessViewArguments {
  const SpotSoldSuccessViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SpotSoldSuccessViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SpotBoughtSuccessViewArguments {
  const SpotBoughtSuccessViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SpotBoughtSuccessViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class EditProfileViewArguments {
  const EditProfileViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant EditProfileViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class MyVehiculesViewArguments {
  const MyVehiculesViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant MyVehiculesViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class MyPaymentMethodesViewArguments {
  const MyPaymentMethodesViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant MyPaymentMethodesViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SpotsHistoryViewArguments {
  const SpotsHistoryViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SpotsHistoryViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class KreynoWalletViewArguments {
  const KreynoWalletViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant KreynoWalletViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class CashoutViewArguments {
  const CashoutViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant CashoutViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class EditVehiculeViewArguments {
  const EditVehiculeViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant EditVehiculeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SetUpLanguageViewArguments {
  const SetUpLanguageViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SetUpLanguageViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class KreyonoPortfolioViewArguments {
  const KreyonoPortfolioViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant KreyonoPortfolioViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class CheckoutMoneyViewArguments {
  const CheckoutMoneyViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant CheckoutMoneyViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class AddVehiculeViewArguments {
  const AddVehiculeViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant AddVehiculeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class AccountSettingsViewArguments {
  const AccountSettingsViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant AccountSettingsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ChangeLanguageViewArguments {
  const ChangeLanguageViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ChangeLanguageViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ChangePhoneNumberViewArguments {
  const ChangePhoneNumberViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ChangePhoneNumberViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class MyParkingSpotsViewArguments {
  const MyParkingSpotsViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant MyParkingSpotsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class AddBankAccountViewArguments {
  const AddBankAccountViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant AddBankAccountViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class PayoutViewArguments {
  const PayoutViewArguments({this.key, required this.wallet});

  final _i36.Key? key;

  final _i37.Wallet wallet;

  @override
  String toString() {
    return '{"key": "$key", "wallet": "$wallet"}';
  }

  @override
  bool operator ==(covariant PayoutViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.wallet == wallet;
  }

  @override
  int get hashCode {
    return key.hashCode ^ wallet.hashCode;
  }
}

class ChooseSellingPlaceLocationViewArguments {
  const ChooseSellingPlaceLocationViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ChooseSellingPlaceLocationViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class MyLetPlaceViewArguments {
  const MyLetPlaceViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant MyLetPlaceViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ClientTrackingViewArguments {
  const ClientTrackingViewArguments({
    this.key,
    required this.parkingSpot,
    required this.reservation,
  });

  final _i36.Key? key;

  final _i38.ParkingSpot parkingSpot;

  final _i39.Reservation reservation;

  @override
  String toString() {
    return '{"key": "$key", "parkingSpot": "$parkingSpot", "reservation": "$reservation"}';
  }

  @override
  bool operator ==(covariant ClientTrackingViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.parkingSpot == parkingSpot &&
        other.reservation == reservation;
  }

  @override
  int get hashCode {
    return key.hashCode ^ parkingSpot.hashCode ^ reservation.hashCode;
  }
}

class SellerTrackingViewArguments {
  const SellerTrackingViewArguments({this.key, required this.reservation});

  final _i36.Key? key;

  final _i39.Reservation reservation;

  @override
  String toString() {
    return '{"key": "$key", "reservation": "$reservation"}';
  }

  @override
  bool operator ==(covariant SellerTrackingViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.reservation == reservation;
  }

  @override
  int get hashCode {
    return key.hashCode ^ reservation.hashCode;
  }
}

class ChatViewArguments {
  const ChatViewArguments({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ChatViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i40.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.homeView,
      arguments: HomeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToStartupView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.startupView,
      arguments: StartupViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToOnboardingView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.onboardingView,
      arguments: OnboardingViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSigninView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.signinView,
      arguments: SigninViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSignupView({
    _i36.Key? key,
    required ({String countryCode, String countryDialCode, String phoneNumber})
    phoneNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.signupView,
      arguments: SignupViewArguments(key: key, phoneNumber: phoneNumber),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSetUpVehiculeView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.setUpVehiculeView,
      arguments: SetUpVehiculeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSetUpPaymentMethodsView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.setUpPaymentMethodsView,
      arguments: SetUpPaymentMethodsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSetUpPermissionsView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.setUpPermissionsView,
      arguments: SetUpPermissionsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSellerSpotDetailsView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.sellerSpotDetailsView,
      arguments: SellerSpotDetailsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToBuyerSpotDetailsView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.buyerSpotDetailsView,
      arguments: BuyerSpotDetailsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSpotSoldSuccessView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.spotSoldSuccessView,
      arguments: SpotSoldSuccessViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSpotBoughtSuccessView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.spotBoughtSuccessView,
      arguments: SpotBoughtSuccessViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToEditProfileView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.editProfileView,
      arguments: EditProfileViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMyVehiculesView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.myVehiculesView,
      arguments: MyVehiculesViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMyPaymentMethodesView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.myPaymentMethodesView,
      arguments: MyPaymentMethodesViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSpotsHistoryView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.spotsHistoryView,
      arguments: SpotsHistoryViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToKreynoWalletView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.kreynoWalletView,
      arguments: KreynoWalletViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCashoutView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.cashoutView,
      arguments: CashoutViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToEditVehiculeView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.editVehiculeView,
      arguments: EditVehiculeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSetUpLanguageView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.setUpLanguageView,
      arguments: SetUpLanguageViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToKreyonoPortfolioView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.kreyonoPortfolioView,
      arguments: KreyonoPortfolioViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCheckoutMoneyView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.checkoutMoneyView,
      arguments: CheckoutMoneyViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAddVehiculeView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.addVehiculeView,
      arguments: AddVehiculeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAccountSettingsView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.accountSettingsView,
      arguments: AccountSettingsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChangeLanguageView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.changeLanguageView,
      arguments: ChangeLanguageViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChangePhoneNumberView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.changePhoneNumberView,
      arguments: ChangePhoneNumberViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMyParkingSpotsView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.myParkingSpotsView,
      arguments: MyParkingSpotsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAddBankAccountView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.addBankAccountView,
      arguments: AddBankAccountViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPayoutView({
    _i36.Key? key,
    required _i37.Wallet wallet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.payoutView,
      arguments: PayoutViewArguments(key: key, wallet: wallet),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChooseSellingPlaceLocationView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.chooseSellingPlaceLocationView,
      arguments: ChooseSellingPlaceLocationViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMyLetPlaceView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.myLetPlaceView,
      arguments: MyLetPlaceViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToClientTrackingView({
    _i36.Key? key,
    required _i38.ParkingSpot parkingSpot,
    required _i39.Reservation reservation,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.clientTrackingView,
      arguments: ClientTrackingViewArguments(
        key: key,
        parkingSpot: parkingSpot,
        reservation: reservation,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSellerTrackingView({
    _i36.Key? key,
    required _i39.Reservation reservation,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.sellerTrackingView,
      arguments: SellerTrackingViewArguments(
        key: key,
        reservation: reservation,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChatView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.chatView,
      arguments: ChatViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithHomeView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.homeView,
      arguments: HomeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithStartupView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.startupView,
      arguments: StartupViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithOnboardingView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.onboardingView,
      arguments: OnboardingViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSigninView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.signinView,
      arguments: SigninViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSignupView({
    _i36.Key? key,
    required ({String countryCode, String countryDialCode, String phoneNumber})
    phoneNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.signupView,
      arguments: SignupViewArguments(key: key, phoneNumber: phoneNumber),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSetUpVehiculeView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.setUpVehiculeView,
      arguments: SetUpVehiculeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSetUpPaymentMethodsView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.setUpPaymentMethodsView,
      arguments: SetUpPaymentMethodsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSetUpPermissionsView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.setUpPermissionsView,
      arguments: SetUpPermissionsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSellerSpotDetailsView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.sellerSpotDetailsView,
      arguments: SellerSpotDetailsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithBuyerSpotDetailsView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.buyerSpotDetailsView,
      arguments: BuyerSpotDetailsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSpotSoldSuccessView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.spotSoldSuccessView,
      arguments: SpotSoldSuccessViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSpotBoughtSuccessView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.spotBoughtSuccessView,
      arguments: SpotBoughtSuccessViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithEditProfileView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.editProfileView,
      arguments: EditProfileViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithMyVehiculesView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.myVehiculesView,
      arguments: MyVehiculesViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithMyPaymentMethodesView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.myPaymentMethodesView,
      arguments: MyPaymentMethodesViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSpotsHistoryView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.spotsHistoryView,
      arguments: SpotsHistoryViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithKreynoWalletView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.kreynoWalletView,
      arguments: KreynoWalletViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithCashoutView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.cashoutView,
      arguments: CashoutViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithEditVehiculeView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.editVehiculeView,
      arguments: EditVehiculeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSetUpLanguageView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.setUpLanguageView,
      arguments: SetUpLanguageViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithKreyonoPortfolioView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.kreyonoPortfolioView,
      arguments: KreyonoPortfolioViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithCheckoutMoneyView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.checkoutMoneyView,
      arguments: CheckoutMoneyViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithAddVehiculeView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.addVehiculeView,
      arguments: AddVehiculeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithAccountSettingsView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.accountSettingsView,
      arguments: AccountSettingsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithChangeLanguageView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.changeLanguageView,
      arguments: ChangeLanguageViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithChangePhoneNumberView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.changePhoneNumberView,
      arguments: ChangePhoneNumberViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithMyParkingSpotsView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.myParkingSpotsView,
      arguments: MyParkingSpotsViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithAddBankAccountView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.addBankAccountView,
      arguments: AddBankAccountViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPayoutView({
    _i36.Key? key,
    required _i37.Wallet wallet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.payoutView,
      arguments: PayoutViewArguments(key: key, wallet: wallet),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithChooseSellingPlaceLocationView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.chooseSellingPlaceLocationView,
      arguments: ChooseSellingPlaceLocationViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithMyLetPlaceView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.myLetPlaceView,
      arguments: MyLetPlaceViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithClientTrackingView({
    _i36.Key? key,
    required _i38.ParkingSpot parkingSpot,
    required _i39.Reservation reservation,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.clientTrackingView,
      arguments: ClientTrackingViewArguments(
        key: key,
        parkingSpot: parkingSpot,
        reservation: reservation,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSellerTrackingView({
    _i36.Key? key,
    required _i39.Reservation reservation,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.sellerTrackingView,
      arguments: SellerTrackingViewArguments(
        key: key,
        reservation: reservation,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithChatView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.chatView,
      arguments: ChatViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}

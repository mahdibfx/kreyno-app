// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/add_payment_cart/add_payment_cart_sheet.dart';
import '../ui/bottom_sheets/add_payment_method/add_payment_method_sheet.dart';
import '../ui/bottom_sheets/buy_spot/buy_spot_sheet.dart';
import '../ui/bottom_sheets/cancelation_reasons/cancelation_reasons_sheet.dart';
import '../ui/bottom_sheets/checkout_money_feedback/checkout_money_feedback_sheet.dart';
import '../ui/bottom_sheets/completed_action/completed_action_sheet.dart';
import '../ui/bottom_sheets/country_code_picker/country_code_picker_sheet.dart';
import '../ui/bottom_sheets/create_spot/create_spot_sheet.dart';
import '../ui/bottom_sheets/danger/danger_sheet.dart';
import '../ui/bottom_sheets/date_picker_filter/date_picker_filter_sheet.dart';
import '../ui/bottom_sheets/delete_account_confirmation/delete_account_confirmation_sheet.dart';
import '../ui/bottom_sheets/home_filter/home_filter_sheet.dart';
import '../ui/bottom_sheets/logout_confirmation/logout_confirmation_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/otp/otp_sheet.dart';
import '../ui/bottom_sheets/pay_for_spot/pay_for_spot_sheet.dart';
import '../ui/bottom_sheets/profile/profile_sheet.dart';
import '../ui/bottom_sheets/rejection_reasons/rejection_reasons_sheet.dart';
import '../ui/bottom_sheets/upload_vehicule_image/upload_vehicule_image_sheet.dart';

enum BottomSheetType {
  notice,
  otp,
  uploadVehiculeImage,
  buySpot,
  payForSpot,
  addPaymentMethod,
  cancelationReasons,
  homeFilter,
  createSpot,
  rejectionReasons,
  profile,
  danger,
  datePickerFilter,
  completedAction,
  addPaymentCart,
  logoutConfirmation,
  deleteAccountConfirmation,
  checkoutMoneyFeedback,
  countryCodePicker,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.otp: (context, request, completer) =>
        OtpSheet(request: request, completer: completer),
    BottomSheetType.uploadVehiculeImage: (context, request, completer) =>
        UploadVehiculeImageSheet(request: request, completer: completer),
    BottomSheetType.buySpot: (context, request, completer) =>
        BuySpotSheet(request: request, completer: completer),
    BottomSheetType.payForSpot: (context, request, completer) =>
        PayForSpotSheet(request: request, completer: completer),
    BottomSheetType.addPaymentMethod: (context, request, completer) =>
        AddPaymentMethodSheet(request: request, completer: completer),
    BottomSheetType.cancelationReasons: (context, request, completer) =>
        CancelationReasonsSheet(request: request, completer: completer),
    BottomSheetType.homeFilter: (context, request, completer) =>
        HomeFilterSheet(request: request, completer: completer),
    BottomSheetType.createSpot: (context, request, completer) =>
        CreateSpotSheet(request: request, completer: completer),
    BottomSheetType.rejectionReasons: (context, request, completer) =>
        RejectionReasonsSheet(request: request, completer: completer),
    BottomSheetType.profile: (context, request, completer) =>
        ProfileSheet(request: request, completer: completer),
    BottomSheetType.danger: (context, request, completer) =>
        DangerSheet(request: request, completer: completer),
    BottomSheetType.datePickerFilter: (context, request, completer) =>
        DatePickerFilterSheet(request: request, completer: completer),
    BottomSheetType.completedAction: (context, request, completer) =>
        CompletedActionSheet(request: request, completer: completer),
    BottomSheetType.addPaymentCart: (context, request, completer) =>
        AddPaymentCartSheet(request: request, completer: completer),
    BottomSheetType.logoutConfirmation: (context, request, completer) =>
        LogoutConfirmationSheet(request: request, completer: completer),
    BottomSheetType.deleteAccountConfirmation: (context, request, completer) =>
        DeleteAccountConfirmationSheet(request: request, completer: completer),
    BottomSheetType.checkoutMoneyFeedback: (context, request, completer) =>
        CheckoutMoneyFeedbackSheet(request: request, completer: completer),
    BottomSheetType.countryCodePicker: (context, request, completer) =>
        CountryCodePickerSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}

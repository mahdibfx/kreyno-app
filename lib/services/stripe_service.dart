import 'package:flutter/material.dart' hide Card;
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
import 'package:fpdart/fpdart.dart';
import 'package:kreyno/app/app.locator.dart';
import 'package:kreyno/app/app.logger.dart';
import 'package:kreyno/dtos/action_on_payment_card_dto.dart';
import 'package:kreyno/dtos/create_stripe_account_dto.dart';
import 'package:kreyno/extensions/api_response_extensions.dart';
import 'package:kreyno/models/card.dart';
import 'package:kreyno/models/setup_intent_response.dart';
import 'package:kreyno/models/strip_connect_onboarding_link_response.dart';
import 'package:kreyno/models/wallet.dart';
import 'package:kreyno/services/api/api_stripe_service.dart';
import 'package:kreyno/services/api/dio_service.dart';
import 'package:kreyno/ui/common/app_colors.dart';
import 'package:kreyno/ui/common/app_spacing.dart';
import 'package:kreyno/ui/common/app_strings.dart';

class StripeService {
  final _logger = getLogger('StripeService');
  final _apiStripeService = ApiStripeService(locator<DioService>().dio);

  Future<Either<String, SetupIntentResponse>> getSetupIntent() {
    return _apiStripeService.getSetupIntent().toEither();
  }

  Future<Either<String, Unit>> initializePaymentSheet({
    required String clientSecret,
    String? merchantDisplayName,
  }) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          setupIntentClientSecret: clientSecret,
          merchantDisplayName: merchantDisplayName ?? 'Kreyno',
          style: ThemeMode.light,
          cardBrandAcceptance: const CardBrandAcceptance.allowed(
            brands: [CardBrandCategory.mastercard, CardBrandCategory.visa],
          ),
          primaryButtonLabel: SetUpPaymentMethodsStrings.saveCard,
          appearance: PaymentSheetAppearance(
            primaryButton: const PaymentSheetPrimaryButtonAppearance(
              colors: PaymentSheetPrimaryButtonTheme(
                light: PaymentSheetPrimaryButtonThemeColors(
                  background: AppColors.greenKre,
                  text: AppColors.mainKre,
                ),
              ),
            ),
            shapes: PaymentSheetShape(borderRadius: AppSpacing.px12),
            formInsetValues: EdgeInsetsConfig(
              left: AppSpacing.px16,
              right: AppSpacing.px16,
              top: AppSpacing.px16,
              bottom: AppSpacing.px20,
            ),
            colors: const PaymentSheetAppearanceColors(
              primary: AppColors.greenKre,
              primaryText: AppColors.mainKre,
              secondaryText: AppColors.textKre,
              background: AppColors.white,
              componentBorder: AppColors.strokeKre,
              placeholderText: AppColors.textKre,
              componentText: AppColors.mainKre,
              error: AppColors.redKre,
            ),
          ),
        ),
      );
      return right(unit);
    } on StripeException catch (e) {
      _logger.e('Failed to initialize payment sheet: ${e.error.message}');
      return left(
        e.error.localizedMessage ?? 'Failed to initialize payment sheet',
      );
    } catch (e) {
      _logger.e('Unexpected error initializing payment sheet: $e');
      return left('An unexpected error occurred');
    }
  }

  Future<Either<String, Unit>> presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      return right(unit);
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        _logger.i('Payment sheet canceled by user');
        return left('');
      }
      _logger.e('Failed to present payment sheet: ${e.error.message}');
      return left(e.error.localizedMessage ?? 'Failed to complete payment');
    } catch (e) {
      _logger.e('Unexpected error presenting payment sheet: $e');
      return left('An unexpected error occurred');
    }
  }

  Future<Either<String, String>> retrievePaymentMethodId(
    String clientSecret,
  ) async {
    try {
      final setupIntent = await Stripe.instance.retrieveSetupIntent(
        clientSecret,
      );
      return right(setupIntent.paymentMethodId);
    } on StripeException catch (e) {
      _logger.e('Failed to retrieve payment method: ${e.error.message}');
      return left(
        e.error.localizedMessage ?? 'Failed to retrieve payment method',
      );
    } catch (e) {
      _logger.e('Unexpected error retrieving payment method: $e');
      return left('An unexpected error occurred');
    }
  }

  Future<Either<String, List<Card>>> getCards() {
    return _apiStripeService.getCards().toEither();
  }

  Future<Either<String, Card>> saveCard(String paymentMethodId) {
    return _apiStripeService
        .saveCard(ActionOnPaymentCardDto(paymentMethodId: paymentMethodId))
        .toEither();
  }

  Future<Either<String, Unit>> setDefaultCard(String paymentMethodId) {
    return _apiStripeService
        .setDefaultCard(
          ActionOnPaymentCardDto(paymentMethodId: paymentMethodId),
        )
        .toEither()
        .then(
          (result) => result.map((_) {
            _logger.i('Default card updated successfully');
            return unit;
          }),
        );
  }

  Future<Either<String, Unit>> removeCard(String paymentMethodId) {
    return _apiStripeService
        .removeCard(ActionOnPaymentCardDto(paymentMethodId: paymentMethodId))
        .toEither()
        .then(
          (result) => result.map((_) {
            _logger.i('Card removed successfully');
            return unit;
          }),
        );
  }

  Future<Either<String, Wallet>> createAccount(
    CreateStripeAccountDto createStripeAccountDto,
  ) {
    return _apiStripeService.createAccount(createStripeAccountDto).toEither();
  }

  Future<Either<String, Unit>> getAccount() {
    return _apiStripeService.getAccount().toEither().then(
      (result) => result.map((_) {
        _logger.i('Stripe account fetched successfully');
        return unit;
      }),
    );
  }

  Future<Either<String, StripeConnectOnboardingLinkResponse>>
  getStripeConnectOnboardingLink() {
    return _apiStripeService.getStripeConnectOnboardingLink().toEither();
  }
}

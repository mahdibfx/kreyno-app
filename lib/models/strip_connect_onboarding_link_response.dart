import 'package:freezed_annotation/freezed_annotation.dart';

part 'strip_connect_onboarding_link_response.freezed.dart';
part 'strip_connect_onboarding_link_response.g.dart';

@freezed
abstract class StripeConnectOnboardingLinkResponse
    with _$StripeConnectOnboardingLinkResponse {
  const factory StripeConnectOnboardingLinkResponse({
    @JsonKey(name: 'url') required String url,
  }) = _StripeConnectOnboardingLinkResponse;

  factory StripeConnectOnboardingLinkResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$StripeConnectOnboardingLinkResponseFromJson(json);
}

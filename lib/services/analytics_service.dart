import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:kreyno/app/app.logger.dart';

/// Signup funnel event names.
///
/// These strings are the contract with the admin dashboard's "Tunnel
/// d'inscription". Renaming one silently breaks a funnel step in GA4, and
/// GA4 cannot backfill, so a rename loses history permanently. Add new names
/// rather than changing existing ones.
abstract class AnalyticsEvents {
  /// 1. The signup form was opened.
  static const registrationStarted = 'registration_started';

  /// 2. The OTP was accepted.
  static const otpVerified = 'otp_verified';

  /// 3. The account exists.
  static const profileCompleted = 'profile_completed';

  /// 4. A vehicle was saved. There is no skip on this step in this app.
  static const vehicleStepCompleted = 'vehicle_step_completed';

  /// 5. A card was added, or the step was skipped.
  static const paymentStepCompleted = 'payment_step_completed';
  static const paymentStepSkipped = 'payment_step_skipped';

  /// 6. Permissions were answered, or the step was skipped.
  static const permissionsStepCompleted = 'permissions_step_completed';
  static const permissionsStepSkipped = 'permissions_step_skipped';

  /// 7. The user reached the app.
  static const onboardingCompleted = 'onboarding_completed';
}

/// Thin wrapper over Firebase Analytics.
///
/// Every call is fire-and-forget and swallows its own errors: analytics must
/// never be able to break a signup. Note that Firebase batches uploads
/// opportunistically, so events are eventually-consistent and can be lost if
/// the app is uninstalled before a flush -- fine for funnel trends, not a
/// source of truth for anything financial.
///
/// `first_open`, `session_start` and the platform dimension are collected
/// automatically by the SDK; only the funnel steps below are explicit.
class AnalyticsService {
  final _logger = getLogger('AnalyticsService');
  final _analytics = FirebaseAnalytics.instance;

  Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {
    try {
      await _analytics.logEvent(name: name, parameters: parameters);
      _logger.i('Analytics event: $name');
    } catch (e) {
      // Never let a reporting failure surface to the user.
      _logger.e('Failed to log analytics event: $name', error: e);
    }
  }

  Future<void> registrationStarted() =>
      logEvent(AnalyticsEvents.registrationStarted);

  /// In this app the backend verifies the OTP inside the register call, so
  /// these two fire together and the dashboard will always show a 100%
  /// conversion between steps 2 and 3. Splitting them would need the backend
  /// to expose a separate verify endpoint.
  Future<void> otpVerifiedAndProfileCompleted() async {
    await logEvent(AnalyticsEvents.otpVerified);
    await logEvent(AnalyticsEvents.profileCompleted);
  }

  Future<void> vehicleStepCompleted() =>
      logEvent(AnalyticsEvents.vehicleStepCompleted);

  Future<void> paymentStep({required bool skipped}) => logEvent(
    skipped
        ? AnalyticsEvents.paymentStepSkipped
        : AnalyticsEvents.paymentStepCompleted,
  );

  Future<void> permissionsStep({required bool skipped}) => logEvent(
    skipped
        ? AnalyticsEvents.permissionsStepSkipped
        : AnalyticsEvents.permissionsStepCompleted,
  );

  Future<void> onboardingCompleted() =>
      logEvent(AnalyticsEvents.onboardingCompleted);
}

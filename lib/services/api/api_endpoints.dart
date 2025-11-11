import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  ApiEndpoints._();

  // BASE URLS
  static final String baseUrl = dotenv.get('API_BASE_URL_DEV');
  static const String _authBaseUrl = 'auth';
  static const String _stripeBaseUrl = 'stripe';
  static const String _mediaBaseUrl = 'media';
  static const String _carBaseUrl = 'cars';
  static const String _parkingPlaceBaseUrl = 'parking-places';
  static const String _reservationBaseUrl = 'reservations';
  static const String _reservationChatBaseUrl = 'reservation-chats';
  static const String _walletBaseUrl = 'wallet';

  // AUTH
  static const String exists = '$_authBaseUrl/exists';
  static const String signIn = '$_authBaseUrl/login';
  static const String register = '$_authBaseUrl/register';
  static const String sendOtp = '$_authBaseUrl/send-otp';
  static const String profile = '$_authBaseUrl/profile';
  static const String changePhoneNumber = '$_authBaseUrl/change-phone';
  static const String updateProfileImage = '$profile/update-image';
  static const String deleteProfileImage = '$profile/delete-image';

  // STRIPE
  static const String setupIntent = '$_stripeBaseUrl/setup-intent';
  static const String cards = '$_stripeBaseUrl/cards';
  static const String saveCard = '$_stripeBaseUrl/save-card';
  static const String setDefaultCard = '$_stripeBaseUrl/set-default-card';
  static const String removeCard = '$_stripeBaseUrl/remove-card';
  static const String stripeAccount = '$_stripeBaseUrl/account';

  // MEDIA
  static const String store = '$_mediaBaseUrl/store';
  static const String removeUpload = '$_mediaBaseUrl/remove-upload/{uuid}';
  static const String deleteUpload = '$_mediaBaseUrl/delete/{id}';

  // CARS
  static const String cars = _carBaseUrl;
  static const String oneCar = '$_carBaseUrl/{id}';
  static const String setDefaultCar = '$_carBaseUrl/set-default/{id}';
  static const String registrationNumber = '$_carBaseUrl/registration/{number}';

  // PARKING-PLACES
  static const String parkingPlaces = _parkingPlaceBaseUrl;
  static const String oneParkingPlace = '$_parkingPlaceBaseUrl/{id}';
  static const String nearbyParkingPlaces = '$_parkingPlaceBaseUrl/nearby';

  // RESERVATIONS
  static const String reservations = _reservationBaseUrl;
  static const String oneReservation = '$_reservationBaseUrl/{id}';
  static const String confirmReservation = '$_reservationBaseUrl/{id}/confirm';
  static const String cancelReservation = '$_reservationBaseUrl/{id}/cancel';
  static const String completeReservation =
      '$_reservationBaseUrl/{id}/complete';
  static const String reservationLocation =
      '$_reservationBaseUrl/{id}/location';

  // RESERVATION-CHAT
  static const String reservationChatsHistory =
      '$_reservationChatBaseUrl/{id}/history';
  static const String reservationChatsSend =
      '$_reservationChatBaseUrl/{id}/send';

  // WALLET
  static const String wallet = _walletBaseUrl;
  static const String walletHistory = '$_walletBaseUrl/history';
  static const String walletWithdraw = '$_walletBaseUrl/withdraw';

  // STRIPE ACCOUNT
  static const String stripeConnectOnboardingLink =
      '$_stripeBaseUrl/connect/onboarding-link';
}

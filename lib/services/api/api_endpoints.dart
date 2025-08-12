import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  ApiEndpoints._();

  static final String baseUrl = dotenv.get('API_BASE_URL_DEV');
  static const String _authBaseUrl = 'auth';
  static const String _stripeBaseUrl = 'stripe';
  static const String _mediaBaseUrl = 'media';
  static const String _carBaseUrl = 'cars';

  // AUTH
  static const String exists = '$_authBaseUrl/exists';
  static const String signIn = '$_authBaseUrl/login';
  static const String register = '$_authBaseUrl/register';
  static const String sendOtp = '$_authBaseUrl/send-otp';
  static const String profile = '$_authBaseUrl/profile';

  // STRIPE
  static const String setupIntent = '$_stripeBaseUrl/setup-intent';
  static const String cards = '$_stripeBaseUrl/cards';
  static const String saveCard = '$_stripeBaseUrl/save-card';
  static const String setDefaultCard = '$_stripeBaseUrl/set-default-card';
  static const String removeCard = '$_stripeBaseUrl/remove-card';

  // MEDIA
  static const String store = '$_mediaBaseUrl/store';
  static const String removeUpload = '$_mediaBaseUrl/remove-upload/{uuid}';
  static const String deleteUpload = '$_mediaBaseUrl/delete/{uuid}';

  // CARS
  static const String cars = _carBaseUrl;
  static const String oneCar = '$_carBaseUrl/{id}';
  static const String setDefaultCar = '$_carBaseUrl/set-default/{id}';
  static const String registrationNumber = '$_carBaseUrl/registration/{number}';
}

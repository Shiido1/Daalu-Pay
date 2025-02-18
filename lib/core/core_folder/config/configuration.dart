enum AppEnvironment { development, production }

class AppConfig {
  static String get apiUrl => 'https://api.daalupay.com/admin/';
  static String get cloudinaryUrl =>
      'https://api.cloudinary.com/v1_1/walexbiz/';
}

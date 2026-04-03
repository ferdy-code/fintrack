class AppConstants {
  static const String apiBaseUrl = 'http://10.20.30.6:8000/api/v1';
  // static const String apiBaseUrl = 'http://192.168.24.249:8000/api/v1';
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const int paginationLimit = 20;
}

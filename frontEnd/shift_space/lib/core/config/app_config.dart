class AppConfig {
  static String get _baseUrl {
    final basePath = 'https://shiftspace-health.onrender.com';
    return basePath;
  }

  static String get fullApiUrl => _baseUrl;
}

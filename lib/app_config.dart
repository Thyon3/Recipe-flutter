class AppConfig {
  static const String appName = 'Flutter Recipe App';
  static const String appVersion = '1.0.0';
  static const bool debugMode = true;
  
  static const Map<String, dynamic> defaultSettings = {
    'theme': 'light',
    'fontSize': 14.0,
    'enableNotifications': true,
  };
  
  static const String apiBaseUrl = 'https://api.recipetap.com';
  static const int apiTimeoutSeconds = 30;
  static const bool enableAnalytics = true;
}

class AppConfig {
  static const apiBaseUrl = String.fromEnvironment('API_BASE_URL',
      defaultValue: 'https://65efcc68ead08fa78a50f929.mockapi.io/api/v1/pairs');
}

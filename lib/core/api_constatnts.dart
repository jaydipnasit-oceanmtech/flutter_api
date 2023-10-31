class ApiConstatnts {
  static const String baseUrl = '';
  static const String liveBaseUrl = '';
  static const String xLocalization = 'en';
  static const String accept = 'application/json';

  var headers = {
    "X-localization": xLocalization,
    "Accept": accept,
    "Content-Type": accept,
    // "Authorization": 'Bearer ${AppFunctions().getUserToken() ?? ''}',
  };
}

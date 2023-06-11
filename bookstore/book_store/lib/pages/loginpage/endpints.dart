class ApiEndPoints {
  static final String baseUrl =
      'https://dhruvilsatani.pythonanywhere.com/data/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = '/register';
  final String loginEmail = '/login';
}

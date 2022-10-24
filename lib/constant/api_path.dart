class ApiPath {
  ApiPath._();
  static const String games = "/games";
  static const String genres = "/genres";
  static String screenshot(int gameId) => "/games/$gameId/screenshots";
}

class ENV {
  static const webPage = 'https://blogtruyen.vn';
  static const nameApp = 'Irohasu';
  static const headersBuilder = {'Referer': webPage};
  static const apiApp = 'http://localhost:1604';
  static const nameDatabase = 'irohasu';

  static String urlWebView(String url) {
    var _urlConvert = url.replaceAll('/api/manga/detail', '');
    return webPage + _urlConvert;
  }
}

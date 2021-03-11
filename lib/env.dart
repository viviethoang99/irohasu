class ENV {
  static const webPage = 'https://blogtruyen.vn';
  static const nameApp = 'Irohasu';
  static const headersBuilder = {'Referer': webPage};
  static const apiApp = 'https://irohasu-bezt-girl.herokuapp.com';
  static const nameDatabase = 'irohasu';

  static String urlWebView(String url) {
    var _urlConvert = url.replaceAll('/api/manga/detail', '');
    return webPage + _urlConvert;
  }
}

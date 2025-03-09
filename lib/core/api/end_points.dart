class Endpoints {
  static final String baseUrl = 'https://www.googleapis.com/books/v1/';
  static const String getNewestBooks =
      'volumes?Filtering=free-ebooks&q=programming&Sorting=newest';
}

class ApiKeys {
  static const String kind = 'kind';
  static const String totalItems = 'totalItems';
  static const String items = 'items';
}

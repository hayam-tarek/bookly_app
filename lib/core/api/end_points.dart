class Endpoints {
  static final String baseUrl = 'https://www.googleapis.com/books/v1/';
  static final String getNewestBooks = getBooks(
    query: ApiKeys.programming,
    sorting: ApiKeys.newest,
    filtering: ApiKeys.freeEbooks,
  );
  static String getFeaturedBooks = getBooks(
    query: ApiKeys.programming,
    sorting: ApiKeys.relevance,
    filtering: ApiKeys.freeEbooks,
  );
  static String getBooks({
    required String query,
    String? sorting,
    String? filtering,
  }) {
    return 'volumes?Filtering=$filtering&q=$query&Sorting=$sorting';
  }
}

class ApiKeys {
  static const String kind = 'kind';
  static const String totalItems = 'totalItems';
  static const String items = 'items';
  static const String query = 'q'; // Query Parameters
  static const String programming = 'programming';
  static const String filter = 'Filter'; // Query Parameters
  static const String freeEbooks = 'free-ebooks';
  static const String paidEbooks = 'paid-ebooks';
  static const String ebook = 'ebook';
  static const String full = 'full';
  static const String partial = 'partial';
  static const String orderBy = 'orderBy'; // Query Parameters
  static const String newest = 'newest';
  static const String relevance = 'relevance';
  static const String printType = 'printType'; // Query Parameters
  static const String all = 'all';
  static const String books = 'books';
  static const String magazines = 'magazines';
  static const String langRestrict = 'langRestrict'; // Query Parameters
  static const String en = 'en';
  static const String er = 'er';
  static const String startIndex = 'startIndex'; // Query Parameters
  static const String maxResults = 'maxResults'; // Query Parameters
}
//langRestrict=en

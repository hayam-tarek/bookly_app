class Endpoints {
  static final String baseUrl = 'https://www.googleapis.com/books/v1/';
  static String getNewestBooks({int pageNumber = 0}) => getBooks(
        query: ApiKeys.general,
        sorting: ApiKeys.newest,
        filter: ApiKeys.ebook,
        pageNumber: pageNumber,
        maxResults: 10,
      );
  static String getFeaturedBooks = getBooks(
    query: ApiKeys.programming,
    sorting: ApiKeys.relevance,
    filter: ApiKeys.ebook,
    pageNumber: 0,
    maxResults: 20,
  );
  static String getRelatedBooks(String category) => getBooks(
        query: category,
        sorting: ApiKeys.relevance,
        filter: ApiKeys.ebook,
        pageNumber: 0,
        maxResults: 20,
      );
  static String getBooks({
    required String query,
    String? sorting,
    String? filter,
    int? pageNumber = 0,
    int? maxResults,
  }) {
    return 'volumes?Filter=$filter&q=$query&orderBy=$sorting&startIndex=${pageNumber! * 10}&maxResults=$maxResults';
  }
}

class ApiKeys {
  static const String kind = 'kind';
  static const String totalItems = 'totalItems';
  static const String items = 'items';
  static const String query = 'q'; // Query Parameters
  static const String programming = 'programming';
  static const String general = 'general';
  static const String intitle = 'intitle:';
  static const String inauthor = 'inauthor:';
  static const String inpublisher = 'inpublisher:';
  static const String subject = 'subject:';
  static const String isbn = 'isbn:';
  static const String lccn = 'lccn:';
  static const String oclc = 'oclc:';
  static const String filter = 'filter'; // Query Parameters
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

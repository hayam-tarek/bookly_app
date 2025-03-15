import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

String getCostOfBook(BookModel book) {
  return book.saleInfo?.saleability! == 'FOR_SALE'
      ? "${book.saleInfo?.listPrice?.amount.toString()} ${book.saleInfo?.listPrice?.currencyCode.toString()}"
      : "Free";
}

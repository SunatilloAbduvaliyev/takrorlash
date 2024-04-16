import '../../data/model/book_model/book_model.dart';

abstract class BookState{}

class BookInitialState extends BookState{}

class BookLoadingState extends BookState{}

class BookSuccessState extends BookState{
  final List<BookModel> data;
  BookSuccessState({required this.data});
}

class BookErrorState extends BookState{
  final String errorMessage;
  BookErrorState({required this.errorMessage});
}


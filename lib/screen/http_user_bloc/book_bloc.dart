import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/data/my_response/my_response.dart';
import 'package:takrorlash/screen/http_user_bloc/user_event.dart';
import 'package:takrorlash/screen/http_user_bloc/user_state.dart';

import '../../data/http_cruds/api_provider/api_provider.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final HttpApiProvider httpApiProvider;

  BookBloc({
    required this.httpApiProvider,
  }) : super(BookInitialState()) {
    on<GetAllBookEvent>(_getAllBook,transformer: droppable());
    on<InsertBookEvent>(_insertBook, transformer:  droppable());
    on<DeleteBookEvent>(_deleteBook, transformer:  droppable());
    on<UpdateBookEvent>(_updateBook, transformer:  droppable());
  }

  Future<void> _getAllBook(
      GetAllBookEvent event, Emitter<BookState> emit) async {
    emit(BookLoadingState());
    MyResponse response = await httpApiProvider.getAllBook();
    if (response.errorMessage.isEmpty) {
      emit(BookSuccessState(data: response.data));
    } else {
      emit(BookErrorState(errorMessage: response.errorMessage));
      throw Exception(response.errorMessage);
    }
  }

  Future<void> _insertBook(
      InsertBookEvent event, Emitter<BookState> emit) async {
    emit(BookLoadingState());
    MyResponse response =
        await httpApiProvider.addBook(bookModel: event.insertData);
    if (response.errorMessage.isEmpty) {
      add(GetAllBookEvent());
    } else {
      emit(BookErrorState(errorMessage: response.errorMessage));
    }
  }

  Future<void> _deleteBook(
      DeleteBookEvent event, Emitter<BookState> emit) async {
    emit(BookLoadingState());
    MyResponse response = await httpApiProvider.deleteBook(uuid: event.uuid);
    if (response.errorMessage.isEmpty) {
      add(GetAllBookEvent());
    } else {
      emit(BookErrorState(errorMessage: response.errorMessage));
    }
  }

  Future<void> _updateBook(
      UpdateBookEvent event, Emitter<BookState> emit) async {
    emit(BookLoadingState());
    MyResponse response =
        await httpApiProvider.updateBook(bookModel: event.updateData);
    if (response.errorMessage.isEmpty) {
      add(GetAllBookEvent());
    } else {
      emit(BookErrorState(errorMessage: response.errorMessage));
    }
  }
}

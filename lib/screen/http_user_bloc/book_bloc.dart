import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/screen/http_user_bloc/user_event.dart';
import 'package:takrorlash/screen/http_user_bloc/user_state.dart';

class UserBloc extends Bloc<BookEvent, BookState>{
  UserBloc():super(BookInitialState()){
    on<InsertBookEvent>(_insertUser);
  }
  Future<void> _insertUser(
      InsertBookEvent event, Emitter<BookState> emit
      )async{}
}
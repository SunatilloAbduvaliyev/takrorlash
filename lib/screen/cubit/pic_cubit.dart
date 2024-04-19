import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/pic_word_model.dart';
import '../../data/repository/local_repositroy.dart';

class PicCubit extends Cubit<List<PicWordModel>> {
  PicCubit() : super(gameList);

  int index = 0;

  void incrementIndex() {
    if(index < 3){
      index++;
    }
    emit(List.from(state));
  }

  void dicrementIndex() {
    if(index > 0){
      index--;
    }
    emit(List.from(state));
  }


}

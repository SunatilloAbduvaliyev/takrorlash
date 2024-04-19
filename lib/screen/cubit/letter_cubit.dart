import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/data/model/letters_model.dart';
import '../../data/repository/local_repositroy.dart';

class LetterCubit extends Cubit<List<LettersModel>> {
  LetterCubit():super(letters);
  List<String> answer = [];
  List<int> index = [];
  bool? isError;
  bool isFinished = false;

  void changeVisible(bool visible, int index) {
    List<LettersModel> newList = List.from(state);
    newList[index] = newList[index].copyWith(visible: visible);
    this.index.add(index);
    debugPrint('________________-add index ${this.index.length}');
    emit(newList);
  }

  void oldVisible(bool visible, int index) {
    List<LettersModel> newList = List.from(state);
    newList[index] = newList[index].copyWith(visible: visible);
    this.index.remove(index);
    debugPrint('________________-remove index ${this.index.length}');

    emit(newList);
  }

  void addAnswer(String answer, String trueAnswer){
    if(this.answer.length < trueAnswer.length){
      debugPrint("Ifga kirdi");
      if(this.answer.length == trueAnswer.length-1){
        isFinished = true;
      }
    this.answer.add(answer);
    }else{
      String newAnswer = '';
      this.answer.forEach((e) => newAnswer += e);
      debugPrint('_______________________----check answer $newAnswer');
      if(newAnswer == trueAnswer.toUpperCase()){
        debugPrint('_______________________----if isError $isError');
        isError = true;
      }else{
        debugPrint('_______________________----else isError $isError');
        isError = false;
      }
    }
    debugPrint('________________-add answer $answer');
  }

  void removeAnswer(String answer){
    this.answer.remove(answer);
    isFinished = false;
    debugPrint('________________-removed answer $answer ');
  }



}
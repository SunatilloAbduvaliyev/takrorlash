import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationButtonCubit extends Cubit<int>{
  NavigationButtonCubit():super(0);
  void increment(){
    emit(state+1);
  }

  void decrement(){
    emit(state-1);
  }

  void changeIndex(int index){
    emit(index);
  }

}
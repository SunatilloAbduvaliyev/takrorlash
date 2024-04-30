import 'package:equatable/equatable.dart';

import '../../data/model/currency_model/currency_model.dart';

abstract class CurrencyState {}

class CurrencyInitialState extends CurrencyState {}

class CurrencyLoadingState extends CurrencyState {}

class CurrencySuccessState extends CurrencyState with EquatableMixin {
  final List<CurrencyModel> data;

  CurrencySuccessState({required this.data});

  @override
  List<Object?> get props => [
        data,
      ];
}

class CurrencyErrorState extends CurrencyState with EquatableMixin {
  final String errorMessage;

  CurrencyErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}

class CurrencyNetworkState extends CurrencyState with EquatableMixin{
  final bool isLocal;
  CurrencyNetworkState({this.isLocal = false});

  @override
  List<Object?> get props => [
        isLocal,
      ];
}

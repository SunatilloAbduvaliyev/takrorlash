import 'package:data_equal/data_equal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/data/local/local_storage.dart';
import 'package:takrorlash/data/model/network_response_model/network_response_model.dart';
import 'package:takrorlash/data/network/api_provider.dart';
import 'package:takrorlash/screen/bloc/currency_event.dart';
import 'package:takrorlash/screen/bloc/currency_state.dart';

import '../../data/model/currency_model/currency_model.dart';
import '../../services/services_locator.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc(this.currencyController) : super(CurrencyInitialState()) {
    on<GetNetworkCurrencyEvent>(_getNetworkCurrency);
    on<GetLocalCurrencyEvent>(_getLocalCurrency);
  }

  final CurrencyController currencyController;

  Future<void> _getNetworkCurrency(
      GetNetworkCurrencyEvent event, Emitter<CurrencyState> emit) async {
    emit(CurrencyLoadingState());
    NetworkResponse response = await getIt.get<ApiProvider>().getCurrencies();
    if (response.errorText.isEmpty) {
      debugPrint(
          '_________________________________________________${response.data.length}');
      List<CurrencyModel> localData = await currencyController.getAllCurrency();
      print('object: ${localData.length}');
      if (localData.isEmpty) {
        for (int i = 0; i < response.data.length; i++) {
          getIt.get<CurrencyController>().insertCurrency(response.data[i]);
        }
      } else {
        for (int i = 0; i < response.data.length - 1; i++) {
          if (dataEqual(
            dataOne: CurrencyModel.toJson(data: response.data[i]),
            dataTwo: CurrencyModel.toJson(data: response.data[i + 1]),
          )) {
            getIt.get<CurrencyController>().insertCurrency(response.data[i]);
          }
        }
      }
      emit(CurrencySuccessState(data: response.data));
    } else if (response.statusCode == 404) {
      debugPrint('___________________________network');
      List<CurrencyModel> localData =
          await currencyController.getAllCurrency();
      if (localData.isEmpty) {
        emit(CurrencyNetworkState(isLocal: true));
      } else {
        emit(CurrencySuccessState(data: localData));
      }
    } else {
      throw Exception(response.errorText);
    }
  }

  Future<void> _getLocalCurrency(
      GetLocalCurrencyEvent event, Emitter<CurrencyState> emit) async {
    emit(CurrencySuccessState(
      data: await getIt.get<CurrencyController>().getAllCurrency(),
    ));
  }
}

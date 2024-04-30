import 'package:hive/hive.dart';
import 'dart:async';
import 'package:takrorlash/data/model/currency_model/currency_model.dart';

class CurrencyController {
  late Box<CurrencyModel> _currencyData;

  CurrencyController() {
    _init();
  }

  Future<void> _init() async {
    _currencyData = await Hive.openBox<CurrencyModel>('currency');
  }

  Future<List<CurrencyModel>> getAllCurrency() async {
    return _currencyData.values.toList();
  }

  Future<void> insertCurrency(CurrencyModel currencyModel) async {
    await _currencyData.put(currencyModel.code, currencyModel);
  }

  void deleteCurrency(int id)  {
    _currencyData.delete(id);
  }

}
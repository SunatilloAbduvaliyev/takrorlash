// "title": "Swiss Franc",
// "code": "CHF",
// "cb_price": "14498.09",
// "nbu_buy_price": "13500.00",
// "nbu_cell_price": "14400.00",
// "date": "04/30/2024"
import 'package:hive/hive.dart';
part 'currency_model.g.dart';
@HiveType(typeId: 0)
class CurrencyModel{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String code;
  @HiveField(2)
  final String cbPrice;
  @HiveField(3)
  final String nbuBuyPrice;
  @HiveField(4)
  final String nbuCellPrice;
  @HiveField(5)
  final String date;


  CurrencyModel({
    required this.title,
    required this.code,
    required this.cbPrice,
    required this.nbuBuyPrice,
    required this.nbuCellPrice,
    required this.date,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      title: json['title'] as String? ?? '',
      code: json['code'] as String? ?? '',
      cbPrice: json['cb_price'] as String? ?? '',
      nbuBuyPrice: json['nbu_buy_price'] as String? ?? '',
      nbuCellPrice: json['nbu_cell_price'] as String? ?? '',
      date: json['date'] as String? ?? '',
    );
  }

  static Map<String, dynamic> toJson({required CurrencyModel data}) {
    return {
      'title': data.title,
      'code': data.code,
      'cb_price': data.cbPrice,
      'nbu_buy_price': data.nbuBuyPrice,
      'nbu_cell_price': data.nbuCellPrice,
      'date': data.date,
    };
  }
}
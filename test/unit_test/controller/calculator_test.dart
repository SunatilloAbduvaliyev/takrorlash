import 'package:flutter_test/flutter_test.dart';
import 'package:takrorlash/controller/calculator.dart';

///testlarimiz void main funksiyiasida boshlanadi.
void main() {
  ///test(description, body) => funksiyamizni testlash uchun test funksiyaisdan foydalanmiz.
  ///test() funksiyasining description qisminda nimani testlayotganimiz haqida ma'lumot beramiz.
  /// boyd qismida esa funksiyamizni testlaymiz.
  ///group orqali bir nechta testlarni bitada testlashimiz mumkin.
  group("Kalkulatorni umumiy testlash", (){
    test(
      "Conulartorning + funksiyasi uchun test",
          () {
        final Calculator calculator = Calculator();

        ///expect(actual, matcher) orqali funksiyamizni tekshimiri.
        ///birinchi parametriga funksiyamizni ishlatamiz.
        ///ikkinchi parametriga javobini yozamiz va shunga tekshiradi.
        expect(calculator.add(a: 4, b: 5), equals(9));
        expect(calculator.add(a: 14, b: 15), equals(29));
      },
    );
    test(
      "Konkulatorning - funksiyasini tekshirish",
          () {
        final Calculator calculator = Calculator();
        expect(calculator.subtract(a: 3, b: 2), equals(1));
      },
    );
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:takrorlash/calculator_screen.dart';

void main() {
  testWidgets(
    "Kalkulator uchun TextField mavjudligini tekshirirsh",
    (tester) async {
      ///biz test fayl ichida widget ni ishga tushurishimiz kerak. Buning 2 ta yo'li bor.
      ///birinchisi butun boshli application ni chaqirish orqali.
      // tester.pumpWidget(const MyApp());
      /// ikkinchi yo'li Material app ni chaqirib o'sha home: ga testlayotgan screen ni berib yuboramiz.
      await tester.pumpWidget(
        const MaterialApp(
          home: CalculatorScreen(),
        ),
      );
      /// Widget timizni topish uchun expect ning find classidan foydalanib va uning
      /// byType ya'ni type ga tekshirish metodi orqali widgetimizni topamiz.
      expect(find.byType(TextFormField), findsNWidgets(2));
      // expect(find.byType(TextFormField), findsOne); findsOne bita widget topish uchun
      //expect(find.byType(TextFormField), findsAny); findsAny qancha bo'sa shuncha widget topish uchun
    },
  );
}

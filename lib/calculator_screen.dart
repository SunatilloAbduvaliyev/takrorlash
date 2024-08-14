import 'package:flutter/material.dart';
import 'package:takrorlash/controller/calculator.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  final Calculator calculator = Calculator();
  int? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: firstNumberController,
              decoration: const InputDecoration(labelText: "Birinchi raqam:"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: firstNumberController,
              decoration: const InputDecoration(labelText: "Ikkinchi raqam:"),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int firstNumber = int.parse(firstNumberController.text);
                      int secondNumber = int.parse(secondNumberController.text);
                      result = calculator.add(a: firstNumber, b: secondNumber);
                    });
                  },
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      int firstNumber = int.parse(firstNumberController.text);
                      int secondNumber = int.parse(secondNumberController.text);
                      result = calculator.subtract(a: firstNumber, b: secondNumber);
                    });
                  },
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            if(result !=null)
              Text(
                result.toString(),
              )
          ],
        ),
      ),
    );
  }
}

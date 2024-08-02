import 'package:flutter/material.dart';

class AutocompleteWidget extends StatefulWidget {
  const AutocompleteWidget({super.key});

  @override
  State<AutocompleteWidget> createState() => _AutocompleteWidgetState();
}

class _AutocompleteWidgetState extends State<AutocompleteWidget> {
  final List<String> items = [
    "banana",
    'apple',
    'orange',
    'potato',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == " ") {
              return const Iterable<String>.empty();
            }
            return items.where(
                  (e) => e.toLowerCase().contains(
                textEditingValue.text.toLowerCase(),
              ),
            );
          },
          onSelected: (String item){
            debugPrint("select item $item");
          },
        ),
      ),
    );
  }
}

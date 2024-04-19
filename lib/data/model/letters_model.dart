class LettersModel{
  final String letter;
   bool visible;

  LettersModel({required this.letter, required this.visible});

  LettersModel copyWith({
   String? letter,
    bool? visible,
  }) => LettersModel(
    letter: letter?? this.letter,
    visible: visible?? this.visible,
  );
}
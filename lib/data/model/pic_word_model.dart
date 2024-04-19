class PicWordModel {
  final List<String> images;
  final String answer;
  final bool visible;

  PicWordModel({required this.visible, required this.images, required this.answer});

  PicWordModel copyWith(
  {
    List<String>? images,
    String? answer,
    bool? visible,
  }) {
    return PicWordModel(
      images: images?? this.images,
      answer: answer?? this.answer,
      visible: visible?? this.visible,
    );
  }

}
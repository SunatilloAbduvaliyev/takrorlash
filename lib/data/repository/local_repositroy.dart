import 'package:takrorlash/data/model/letters_model.dart';

import '../../utils/images/app_images.dart';
import '../model/pic_word_model.dart';

List<PicWordModel> gameList = [
  PicWordModel(
    images: [
      AppImages.catFour,
      AppImages.catThree,
      AppImages.catOne,
      AppImages.catTwo,
    ],
    answer: 'Cat',
    visible: false,
  ),
  PicWordModel(
    images: [
      AppImages.iceFour,
      AppImages.iceThree,
      AppImages.iceOne,
      AppImages.iceTwo,
    ],
    answer: 'Ice',
    visible: false,
  ),
  PicWordModel(
    images: [
      AppImages.horseFour,
      AppImages.horseThree,
      AppImages.horseOne,
      AppImages.horseTwo,
    ],
    answer: 'Horse',
    visible: false,
  ),
  PicWordModel(
    images: [
      AppImages.bookFour,
      AppImages.bookThree,
      AppImages.bookOne,
      AppImages.bookTwo,
    ],
    answer: 'Book',
    visible: false,
  )
];
List<LettersModel> letters = [
  LettersModel(letter:'A' , visible: false),
  LettersModel(letter:'B' , visible: false),
  LettersModel(letter:'C' , visible: false),
  LettersModel(letter:'D' , visible: false),
  LettersModel(letter:'E' , visible: false),
  LettersModel(letter:'F' , visible: false),
  LettersModel(letter:'G' , visible: false),
  LettersModel(letter:'H' , visible: false),
  LettersModel(letter:'I' , visible: false),
  LettersModel(letter:'J' , visible: false),
  LettersModel(letter:'K' , visible: false),
  LettersModel(letter:'L' , visible: false),
  LettersModel(letter:'M' , visible: false),
  LettersModel(letter:'N' , visible: false),
  LettersModel(letter:'O' , visible: false),
  LettersModel(letter:'P' , visible: false),
  LettersModel(letter:'Q' , visible: false),
  LettersModel(letter:'R' , visible: false),
  LettersModel(letter:'S' , visible: false),
  LettersModel(letter:'T' , visible: false),
  LettersModel(letter:'U' , visible: false),
  LettersModel(letter:'V' , visible: false),
  LettersModel(letter:'W' , visible: false),
  LettersModel(letter:'X' , visible: false),
  LettersModel(letter:'Y' , visible: false),
  LettersModel(letter:'Z' , visible: false),
];

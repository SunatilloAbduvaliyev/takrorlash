import 'package:flutter_test/flutter_test.dart';
import 'package:takrorlash/data/repository/local_repositroy.dart';
import 'package:takrorlash/screen/cubit/letter_cubit.dart';

void main() {
  group('LetterCubit', () {
    late LetterCubit letterCubit;

    setUp(() {
      letterCubit = LetterCubit();
    });

    tearDown(() {
      letterCubit.close();
    });

    test('initial state is correct', () {
      expect(letterCubit.state, letters);
    });

    test('addAnswer adds correct answer', () {
      letterCubit.addAnswer('a', 'apple');
      expect(letterCubit.answer, ['a']);
      expect(letterCubit.isFinished, false);
    });

    test('removeAnswer removes correct answer', () {
      letterCubit.addAnswer('a', 'apple');
      letterCubit.removeAnswer('a');
      expect(letterCubit.answer, []);
      expect(letterCubit.isFinished, false);
    });

    test('changeVisible toggles visibility correctly', () {
      letterCubit.changeVisible(true, 0);
      expect(letterCubit.state[0].visible, true);

      letterCubit.changeVisible(false, 0);
      expect(letterCubit.state[0].visible, false);
    });

    // Add more tests as needed
  });
}

import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static const String fiveLetterWords = 'five_letter_words';
  static const String sixLetterWords = 'six_letter_words';
  static const String sevenLetterWords = 'seven_letter_words';

  static late Box fiveLetterWordsBox;
  static late Box sixLetterWordsBox;
  static late Box sevenLetterWordsBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    fiveLetterWordsBox = await Hive.openBox(fiveLetterWords);
    sixLetterWordsBox = await Hive.openBox(sixLetterWords);
    sevenLetterWordsBox = await Hive.openBox(sevenLetterWords);
  }

  static bool isWord(String word) {
    return fiveLetterWordsBox.values.contains(word) ||
        sixLetterWordsBox.values.contains(word) ||
        sevenLetterWordsBox.values.contains(word);
  }

  static String randomWord(int length, Box box) {
    final words = box.values.toList().cast<String>();
    return words[Random().nextInt(words.length)];
  }
}

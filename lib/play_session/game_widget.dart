import 'package:basic/audio/audio_controller.dart';
import 'package:basic/audio/sounds.dart';
import 'package:basic/game_internals/level_state.dart';
import 'package:basic/helpers/hive_helper.dart';
import 'package:basic/models/letter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic/Components/NeuBox.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({super.key, required this.letterCount});

  final int letterCount;

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  late String randWord;
  bool checkWord = false;

  late List<List<Letter>> rowData;
  late Box box;

  late int letters;

  int currentColIndex = 0;
  int currentRowIndex = 0;

  List<List<Letter>> generateRows() {
    return List.generate(
        6,
        (index) => List.generate(letters,
            (index) => Letter(letter: "", color: const Color(0xffDBDBDB))));
  }

  @override
  void initState() {
    super.initState();
    letters = 4 + widget.letterCount;

    if (letters == 5) {
      box = HiveHelper.fiveLetterWordsBox;
    } else if (letters == 6) {
      box = HiveHelper.sixLetterWordsBox;
    } else {
      box = HiveHelper.sevenLetterWordsBox;
    }

    rowData = generateRows();
    randWord = HiveHelper.randomWord(letters, box).trim();
    print("Random Word: $randWord");
  }

  Widget buildBox(Letter letter, {Color textColor = Colors.black}) {
    final fontConfig1 = GoogleFonts.montserrat(
        fontSize: 14, fontWeight: FontWeight.w500, color: textColor);

    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          color: letter.color,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 10,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(-4, -4),
            ),
          ]),
      child: Center(
          child: Text(
        letter.letter,
        style: fontConfig1,
      )),
    );
  }

  String getWord() {
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < rowData[currentRowIndex].length; i++) {
      buffer.write(rowData[currentRowIndex][i].letter);
    }

    return buffer.toString();
  }

  void updateRow() {
    final word = getWord().toLowerCase();

    for (int i = 0; i < word.length; i++) {
      final index = randWord.indexOf(word[i]);

      if (index == -1) {
        rowData[currentRowIndex][i].color = Colors.grey;
      } else if (word[i] == randWord[i]) {
        rowData[currentRowIndex][i].color = Colors.green;
      } else {
        rowData[currentRowIndex][i].color = Colors.yellow;
      }
    }

    checkWord = word == randWord;
  }

  @override
  Widget build(BuildContext context) {
    final fontConfig =
        GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w500);
    final levelState = context.watch<LevelState>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: rowData
                .map((e) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: e.map((e) => buildBox(e)).toList(),
                    ))
                .toList(),
          ),
        ),
        const Gap(200),
        Column(
          children: [
            Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
              children:
                  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'].map((key) {
                return GestureDetector(
                  onTap: () {
                    addLetter(key);
                  },
                  child: Neubox(
                    children: Text(key, style: fontConfig),
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'].map((key) {
                return GestureDetector(
                  onTap: () {
                    addLetter(key);
                    print(rowData[currentRowIndex]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Neubox(
                      children: Text(key, style: fontConfig),
                    ),
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (currentColIndex != 0) currentColIndex--;
                    // if (currentColIndex == letters) {
                    //   currentColIndex = currentColIndex - 1;
                    // }

                    if (currentColIndex == 0) {
                      rowData[currentRowIndex][currentColIndex].letter = "";
                    } else {
                      rowData[currentRowIndex][currentColIndex].letter = "";
                    }

                    setState(() {});
                  },
                  child: Neubox(
                    children: Text(' ⌫ ', style: fontConfig),
                  ),
                ),
                ...['Z', 'X', 'C', 'V', 'B', 'N', 'M'].map((key) {
                  return GestureDetector(
                    onTap: () {
                      addLetter(key);
                    },
                    child: Neubox(
                      children: Text(key, style: fontConfig),
                    ),
                  );
                }),
                GestureDetector(
                  onTap: () {
                    print("Random Word: $randWord");
                    if (currentRowIndex > 5) {
                      return;
                    }

                    final word = getWord().toLowerCase();

                    if (word == null || word.isEmpty) {
                      final dialog = AlertDialog(
                        title: const Text('Walang Pinili!'),
                        content: const Text(
                            'Hindi ka pumili ng anumang titik. Mangyaring pumili ng titik bago magpatuloy.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('SIGE'),
                          ),
                        ],
                      );
                      showDialog(context: context, builder: (_) => dialog);

                      return;
                    } else if (!HiveHelper.isWord(word, box) || word == "") {
                      print('Word: ${word.length} ${randWord.length}');
                      final dialog = AlertDialog(
                        title: const Text('Maling Salita!'),
                        content: const Text(
                            'Ang salitang ito ay hindi nasa aming listahan ng mga salita. Subukan muli!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('SIGE'),
                          ),
                        ],
                      );

                      showDialog(context: context, builder: (_) => dialog);

                      return;
                    }

                    updateRow();

                    currentColIndex = 0;
                    currentRowIndex++;

                    setState(() {});

                    if (checkWord) {
                      levelState.setProgress(100);
                      context.read<AudioController>().playSfx(SfxType.wssh);
                      levelState.evaluate();
                    } else if (currentRowIndex == 6) {
                      final dialog = AlertDialog(
                        title: const Text('Maling Salita!'),
                        content: Text('GG! Ang tamang salita ay $randWord'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: const Text('Balik'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              GoRouter.of(context)
                                  .push('/play/session/${widget.letterCount}');
                            },
                            child: const Text('Ulitin'),
                          ),
                        ],
                      );

                      showDialog(context: context, builder: (_) => dialog);
                    }
                  },
                  child: Neubox(
                    children: Text('Enter', style: fontConfig),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  void addLetter(String l) {
    if (currentColIndex == letters) return;

    rowData[currentRowIndex][currentColIndex].letter = l;
    currentColIndex++;

    setState(() {});
  }
}

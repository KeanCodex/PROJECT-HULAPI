import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:basic/Components/NeuBox.dart';
import 'package:gap/gap.dart';
import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../level_selection/levels.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fontConfig =
        GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w500);
    final fontConfig1 =
        GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500);

    Widget _buildBox(String letter) {
      return Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: Color(0xffDBDBDB),
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
          letter,
          style: fontConfig1,
        )),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => _buildBox(
                      _textEditingController.text.length > index
                          ? _textEditingController.text[index]
                          : ''),
                ),
              ),
            ],
          ),
        ),
        const Gap(100),
        Column(
          children: [
            Row(
              children:
                  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'].map((key) {
                return GestureDetector(
                  onTap: () {
                    _textEditingController.text += key;
                    setState(() {});
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
                    _textEditingController.text += key;
                    setState(() {});
                  },
                  child: Neubox(
                    children: Text(key, style: fontConfig),
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [' ⌫ ', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'Enter']
                  .map((key) {
                return GestureDetector(
                  onTap: () {
                    if (key == ' ⌫ ') {
                      if (_textEditingController.text.isNotEmpty) {
                        _textEditingController.text =
                            _textEditingController.text.substring(
                                0, _textEditingController.text.length - 1);
                        setState(() {});
                      }
                    } else if (key == 'Enter') {
                      // Handle Enter key press
                    } else {
                      _textEditingController.text += key;
                      setState(() {});
                    }
                  },
                  child: Neubox(
                    children: Text(key, style: fontConfig),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}

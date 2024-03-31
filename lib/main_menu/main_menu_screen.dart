import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../style/my_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController = context.watch<AudioController>();

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Mainback.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 470, left: 100),
            child: ElevatedButton(
              onPressed: () {
                audioController.playSfx(SfxType.buttonTap);
                GoRouter.of(context).go('/play');
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
              child: Text('Maglaro na!',
                  style: GoogleFonts.montserrat(
                      fontSize: 16, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

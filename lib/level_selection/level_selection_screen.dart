import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../player_progress/player_progress.dart';
import '../style/responsive_screen.dart';
import 'levels.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final playerProgress = context.watch<PlayerProgress>();

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Background2.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          ResponsiveScreen(
            squarishMainArea: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      'Pumili ng Antas',
                      style: GoogleFonts.montserrat(fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: ListView(
                    children: [
                      for (final level in gameLevels)
                        ListTile(
                          enabled: playerProgress.highestLevelReached >=
                              level.number - 1,
                          onTap: () {
                            final audioController =
                                context.read<AudioController>();
                            audioController.playSfx(SfxType.buttonTap);

                            GoRouter.of(context)
                                .go('/play/session/${level.number}');
                          },
                          leading: Text(
                            level.number.toString(),
                            style: GoogleFonts.montserrat(),
                          ),
                          title: Text(
                            'Level #${level.number}',
                            style: GoogleFonts.montserrat(),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
            rectangularMenuArea: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/');
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
              child: Text('Bumalik',
                  style: GoogleFonts.montserrat(
                      fontSize: 16, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

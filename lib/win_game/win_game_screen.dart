// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../game_internals/score.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class WinGameScreen extends StatelessWidget {
  final Score score;

  const WinGameScreen({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    const gap = SizedBox(height: 10);

    return Scaffold(
      backgroundColor: palette.backgroundPlaySession,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                gap,
                Center(
                  child: Text(
                    'Nanalo ka!',
                    style: GoogleFonts.ubuntu(fontSize: 50),
                  ),
                ),
                const Gap(100),
                Center(
                  child: Text(
                    'Puntos:  ${score.score}\n'
                    'Oras:  ${score.formattedTime}',
                    style: const TextStyle(fontFamily: 'ubuntu', fontSize: 20),
                  ),
                ),
              ],
            ),
            rectangularMenuArea: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/play');
              },
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStatePropertyAll(Colors.blueGrey)),
              child: Text(
                'Magpatuloy',
                style: GoogleFonts.ubuntu(fontSize: 17, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

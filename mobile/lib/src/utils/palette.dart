// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A palette of colors to be used in the game.
///
/// The reason we're not going with something like Material Design's
/// `Theme` is simply that this is simpler to work with and yet gives
/// us everything we need for a game.
///
/// Games generally have more radical color palettes than apps. For example,
/// every level of a game can have radically different colors.
/// At the same time, games rarely support dark mode.
///
/// Colors taken from this fun palette:
/// https://lospec.com/palette-list/crayola84
///
/// Colors here are implemented as getters so that hot reloading works.
/// In practice, we could just as easily implement the colors
/// as `static const`. But this way the palette is more malleable:
/// we could allow players to customize colors, for example,
/// or even get the colors from the network.
///

class Palette {
  Color get pen => const Color(0xff1d75fb);
  Color get darkPen => const Color(0xFF0050bc);
  Color get redPen => const Color(0xFFd10841);
  Color get inkFullOpacity => const Color(0xff352b42);
  Color get ink => const Color(0xee352b42);
  Color get backgroundMain => const Color(0xffffffd1);
  Color get backgroundLevelSelection => const Color(0xffa2dcc7);
  Color get backgroundPlaySession => const Color(0xffffebb5);
  Color get background4 => const Color(0xffffd7ff);
  Color get backgroundSettings => const Color(0xffbfc8e3);
  Color get trueWhite => const Color(0xffffffff);

  Color get brown => const Color(0xffB48F0E);
  Color get red => const Color(0xffEB5757);
  Color get gray1 => const Color(0xffD9D9D9);
  Color get gray4 => const Color(0xffBDBDBD);
  Color get gray2 => const Color(0xff4F4F4F);
  Color get gray3 => const Color(0xff828282);
  Color get gray7 => const Color(0xff333333);
  Color get gray8 => const Color(0xff111111);
  Color get gray9 => const Color(0xff151515);
  Color get gray10 => const Color(0xff000000);
  Color get green2 => const Color(0xff27AE60);
  Color get purple => const Color(0xff7801A1);
  Color get primary => const Color(0xffBB26EF);
  Color get secondary => const Color(0xffFFCB14);
}

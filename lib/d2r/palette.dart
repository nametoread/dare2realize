import 'dart:math';

import 'package:flutter/material.dart';

class Palette {
  static const List _material400 = [
    0xef5350,
    0xec407a,
    0xab47bc,
    0x7e57c2,
    0x5c6bc0,
    0x42a5f5,
    0x29b6f6,
    0x26c6da,
    0x26a69a,
    0x66bb6a,
    0x9ccc65,
    0xd4e157,
    0xffee58,
    0xffca28,
    0xffa726,
    0xff7043,
    0x8d6e63,
    0xbdbdbd,
    0x78909c,
  ];

  static List<Color> getRandomGradient() {
    var roll = _material400.toList()..shuffle();
    return [Color(roll[0]).withOpacity(0.7), Color(roll[1]).withOpacity(0.5)];
  }

  static Color getRandomColor() =>
      Color((Random().nextDouble() * 0xffffff).toInt()).withOpacity(0.5);
}

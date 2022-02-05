import 'package:flutter/material.dart';

Color tabuleiroColor(int value) {
  if (value == 1 || value == 37) {
    return colorsCobrasEscadas[0];
  } else if (value == 5 || value == 15) {
    return colorsCobrasEscadas[1];
  } else if (value == 6 || value == 13) {
    return colorsCobrasEscadas[2];
  } else if (value == 7 || value == 30) {
    return colorsCobrasEscadas[3];
  } else if (value == 10 || value == 48) {
    return colorsCobrasEscadas[4];
  } else if (value == 14 || value == 25) {
    return colorsCobrasEscadas[5];
  } else if (value == 18 || value == 61) {
    return colorsCobrasEscadas[6];
  } else if (value == 20 || value == 41) {
    return colorsCobrasEscadas[7];
  } else if (value == 24 || value == 45) {
    return colorsCobrasEscadas[8];
  } else if (value == 27 || value == 83) {
    return colorsCobrasEscadas[9];
  } else if (value == 35 || value == 43) {
    return colorsCobrasEscadas[10];
  } else if (value == 50 || value == 66) {
    return colorsCobrasEscadas[11];
  } else if (value == 52 || value == 73) {
    return colorsCobrasEscadas[12];
  } else if (value == 67 || value == 88) {
    return colorsCobrasEscadas[13];
  } else if (value == 70 || value == 90) {
    return colorsCobrasEscadas[14];
  } else if (value == 74 || value == 94) {
    return colorsCobrasEscadas[15];
  } else if (value == 77 || value == 97) {
    return colorsCobrasEscadas[0];
  } else if (value == 79 || value == 98) {
    return colorsCobrasEscadas[1];
  } else if (value == 87 || value == 91) {
    return colorsCobrasEscadas[5];
  } else if (value == 86 || value == 93) {
    return colorsCobrasEscadas[8];
  } else {
    return Colors.white;
  }
}

List<Color> colorsCobrasEscadas = [
  const Color(0xFF8BD674),
  const Color(0xFF6F6E78),
  const Color(0xFF7383B9),
  const Color(0xFFF2CB55),
  const Color(0xFFEBA8C3),
  const Color(0xFFEB4971),
  const Color(0xFFFFA756),
  const Color(0xFF8571BE),
  const Color(0xFF4C91B3),
  const Color(0xFFEA5D60),
  const Color(0xFF9F6E97),
  const Color(0xFFBAAB82),
  const Color(0xFFA552CC),
  const Color(0xFF61CEC0),
  const Color(0xFFFFC5E6),
  const Color(0xFFAEBFD7),
];

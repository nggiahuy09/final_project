import 'package:flutter/material.dart';

class ColorManager {
  // light colors
  static Color primary = HexColor.fromHex("#0077b6");
  static Color primaryOpacity70 = HexColor.fromHex("b30077b6");
  static Color secondary = HexColor.fromHex("#00b4d8");
  static Color tertiary = HexColor.fromHex("#90e0ef");
  
  // dark colors
  static Color darkPrimary = HexColor.fromHex("#03045e");
  static Color darkSecondary = HexColor.fromHex("#0096c7");
  static Color darkTertiary = HexColor.fromHex("#00b4d8");

  // other colors
  static Color black = HexColor.fromHex("#0d0106");
  static Color red = HexColor.fromHex("#ff331f");
  static Color white = HexColor.fromHex("#fbfbff");
  static Color grey = HexColor.fromHex("#979dac");

  // status colors
  static Color success = HexColor.fromHex("#0077b6");
  static Color warning = HexColor.fromHex("#ff331f");

  // grey colors
  static Color darkGrey = HexColor.fromHex("#343a40");
  static Color lightGrey = HexColor.fromHex("#adb5bd");
  static Color mediumGrey = HexColor.fromHex("#6c757d");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');

    // note: handle no-opacity value in hexa string
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}

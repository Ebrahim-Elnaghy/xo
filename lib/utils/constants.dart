import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  static var customFontWhite = GoogleFonts.coiny(
    textStyle: const TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 28,
    ),
  );
  
  static const boxWinColor = Color(0xFF27d075);
  static const boxColor = Color(0xff211355);
  static const bgColor = Color(0xff271767);

  static const List<List<int>> winLines = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
    [0, 4, 8], [2, 4, 6] // Diagonals
  ];
}

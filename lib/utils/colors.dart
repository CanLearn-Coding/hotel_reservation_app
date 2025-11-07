import 'package:flutter/material.dart';

class AppColors {
  // Maroon utama
  static const Color maroon = Color(0xFF800000);

  // Merah aksen
  static const Color red = Color(0xFFFF0000);

  // Putih
  static const Color white = Color(0xFFFFFFFF);

  // Merah muda / soft red (opsional untuk hover, button)
  static const Color lightRed = Color(0xFFFF6666);

  // Maroon gelap (opsional untuk text atau shadow)
  static const Color darkMaroon = Color(0xFF4B0000);

  // Background putih soft
  static const Color bgWhite = Color(0xFFF5F5F5);
}

// CONTOH PENGGUNAAN:
// Container(
//   color: AppColors.maroon,
//   child: Text(
//     'Hello UI',
//     style: TextStyle(color: AppColors.white),
//   ),
// 

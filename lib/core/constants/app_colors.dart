import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0F0F0F);
  static const Color card = Color(0xFF1C1C1C);
  static const Color primary = Color(0xFFE50914);
  static const Color secondary = Color(0xFFB81D24);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFBDBDBD); // Grey 400 equivalent
  static const Color transparent = Colors.transparent;
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient darkOverlayGradient = LinearGradient(
    colors: [Colors.transparent, Colors.black87, Colors.black],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.7, 1.0],
  );
}

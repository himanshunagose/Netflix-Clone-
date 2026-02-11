import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class GradientOverlay extends StatelessWidget {
  final double height;
  final List<Color> colors;
  final List<double> stops;

  const GradientOverlay({
    super.key,
    this.height = 100,
    this.colors = const [Colors.transparent, AppColors.background],
    this.stops = const [0.0, 1.0],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
          stops: stops,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../utils/theme.dart';

class TimerDisplay extends StatelessWidget {
  final String time;
  final bool isRunning;

  const TimerDisplay({
    super.key,
    required this.time,
    required this.isRunning,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 150),
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.12,
        fontWeight: FontWeight.w200,
        letterSpacing: 4,
        color: isRunning ? AppColors.textPrimary : AppColors.textSecondary,
        fontFeatures: const [FontFeature.tabularFigures()],
      ),
      child: Text(
        time,
        textAlign: TextAlign.center,
      ),
    );
  }
}

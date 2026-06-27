import 'package:flutter/material.dart';

import '../models/lap_model.dart';
import '../utils/theme.dart';

class LapCard extends StatelessWidget {
  final LapModel lap;
  final bool isNewest;
  final bool isFastest;

  const LapCard({
    super.key,
    required this.lap,
    this.isNewest = false,
    this.isFastest = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: isNewest
            ? AppColors.surfaceElevated
            : AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isNewest
              ? AppColors.primary.withValues(alpha: 0.3)
              : AppColors.surfaceLight,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isFastest
                  ? AppColors.success.withValues(alpha: 0.15)
                  : AppColors.secondary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '${lap.lapNumber}',
                style: TextStyle(
                  color: isFastest ? AppColors.success : AppColors.secondary,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lap ${lap.lapNumber}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  lap.formattedTotalTime,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Diff',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                lap.formattedDifference,
                style: TextStyle(
                  color: lap.difference.inMilliseconds == 0
                      ? AppColors.textSecondary
                      : isFastest
                          ? AppColors.success
                          : AppColors.warning,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

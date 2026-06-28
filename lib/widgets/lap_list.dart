import 'package:flutter/material.dart';

import '../models/lap_model.dart';
import '../utils/theme.dart';
import 'lap_card.dart';

class LapList extends StatelessWidget {
  final List<LapModel> laps;

  const LapList({
    super.key,
    required this.laps,
  });

  @override
  Widget build(BuildContext context) {
    if (laps.isEmpty) {
      return Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/illustrations/empty_state.png',
                height: 180,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                'No laps recorded yet.',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Start the timer and tap Lap to log your times',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    Duration shortest = Duration.zero;
    bool first = true;
    for (final lap in laps) {
      if (lap.lapNumber == 1) continue;
      if (first || lap.lapTime < shortest) {
        shortest = lap.lapTime;
        first = false;
      }
    }

    return ListView.builder(
      shrinkWrap: false,
      padding: const EdgeInsets.only(top: 4, bottom: 24),
      itemCount: laps.length,
      itemBuilder: (context, index) {
        final lap = laps[index];
        final bool hasLapsForComparison = !first;
        final bool isFastest =
            lap.lapNumber > 1 && hasLapsForComparison && lap.lapTime == shortest;

        return LapCard(
          key: ValueKey('lap_${laps[index].lapNumber}'),
          lap: laps[index],
          isNewest: index == 0,
          isFastest: isFastest,
        );
      },
    );
  }
}

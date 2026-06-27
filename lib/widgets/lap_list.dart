import 'package:flutter/material.dart';

import '../models/lap_model.dart';
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
      return const SizedBox.shrink();
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

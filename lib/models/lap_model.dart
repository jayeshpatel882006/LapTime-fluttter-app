import 'package:flutter/material.dart';

@immutable
class LapModel {
  final int lapNumber;
  final Duration lapTime;
  final Duration totalTime;
  final Duration difference;

  const LapModel({
    required this.lapNumber,
    required this.lapTime,
    required this.totalTime,
    required this.difference,
  });

  String get formattedLapTime => _formatDuration(lapTime);
  String get formattedTotalTime => _formatDuration(totalTime);
  String get formattedDifference => '+${_formatDuration(difference)}';

  static String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    final milliseconds = duration.inMilliseconds.remainder(1000);

    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}.'
        '${milliseconds.toString().padLeft(3, '0')}';
  }
}

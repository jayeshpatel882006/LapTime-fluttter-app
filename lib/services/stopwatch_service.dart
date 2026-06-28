import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/lap_model.dart';
import '../utils/constants.dart';

enum StopwatchState { initial, running, paused }

class StopwatchService extends ChangeNotifier {
  Timer? _timer;
  Duration _elapsed = Duration.zero;
  Duration _lapStartTime = Duration.zero;
  StopwatchState _state = StopwatchState.initial;
  final List<LapModel> _laps = [];
  int _lapCount = 0;
  Duration _lastTotalTime = Duration.zero;

  // System clock-based timing fields
  DateTime? _startTime;
  DateTime? _pauseStartTime;
  Duration _totalPausedDuration = Duration.zero;

  Duration get elapsed => _elapsed;
  StopwatchState get state => _state;
  List<LapModel> get laps => List.unmodifiable(_laps);
  int get lapCount => _lapCount;

  bool get isInitial => _state == StopwatchState.initial;
  bool get isRunning => _state == StopwatchState.running;
  bool get isPaused => _state == StopwatchState.paused;

  String get formattedTime {
    final hours = _elapsed.inHours;
    final minutes = _elapsed.inMinutes.remainder(60);
    final seconds = _elapsed.inSeconds.remainder(60);
    final milliseconds = _elapsed.inMilliseconds.remainder(1000);

    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}.'
        '${milliseconds.toString().padLeft(3, '0')}';
  }

  void start() {
    if (!isInitial) return;
    _state = StopwatchState.running;
    _startTime = DateTime.now();
    _totalPausedDuration = Duration.zero;
    _startTimer();
    notifyListeners();
  }

  void pause() {
    if (!isRunning) return;
    final now = DateTime.now();
    _state = StopwatchState.paused;
    _pauseStartTime = now;
    _elapsed = now.difference(_startTime!) - _totalPausedDuration;
    _stopTimer();
    notifyListeners();
  }

  void resume() {
    if (!isPaused) return;
    _state = StopwatchState.running;
    _totalPausedDuration += DateTime.now().difference(_pauseStartTime!);
    _pauseStartTime = null;
    _startTimer();
    notifyListeners();
  }

  void reset() {
    if (isInitial) return;
    _stopTimer();
    _elapsed = Duration.zero;
    _lapStartTime = Duration.zero;
    _lastTotalTime = Duration.zero;
    _startTime = null;
    _pauseStartTime = null;
    _totalPausedDuration = Duration.zero;
    _state = StopwatchState.initial;
    _laps.clear();
    _lapCount = 0;
    notifyListeners();
  }

  void addLap() {
    if (!isRunning) return;
    _lapCount++;
    final segmentTime = _elapsed - _lapStartTime;
    final totalTime = _elapsed;
    final difference = _lapCount > 1 ? totalTime - _lastTotalTime : Duration.zero;
    _lastTotalTime = totalTime;
    _lapStartTime = _elapsed;

    final lap = LapModel(
      lapNumber: _lapCount,
      lapTime: segmentTime,
      totalTime: totalTime,
      difference: difference,
    );

    _laps.insert(0, lap);

    _provideHapticFeedback();
    notifyListeners();
  }

  void _provideHapticFeedback() {
    HapticFeedback.mediumImpact();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(AppConstants.timerInterval, (_) {
      _elapsed = DateTime.now().difference(_startTime!) - _totalPausedDuration;
      notifyListeners();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

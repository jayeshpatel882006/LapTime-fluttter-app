import 'package:flutter/material.dart';

import '../services/stopwatch_service.dart';
import '../utils/constants.dart';
import '../utils/theme.dart';
import '../widgets/adaptive_buttons.dart';
import '../widgets/lap_list.dart';
import '../widgets/timer_display.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  late final StopwatchService _stopwatchService;

  @override
  void initState() {
    super.initState();
    _stopwatchService = StopwatchService();
    _stopwatchService.addListener(_onStopwatchUpdate);
  }

  void _onStopwatchUpdate() {
    setState(() {});
  }

  @override
  void dispose() {
    _stopwatchService.removeListener(_onStopwatchUpdate);
    _stopwatchService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/welcome_bg.png'),
            fit: BoxFit.cover,
            opacity: 0.15,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo/secondary_logo.png',
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    AppConstants.timerTitle,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              SizedBox(
                height: screenHeight * 0.30,
                child: Center(
                  child: TimerDisplay(
                    time: _stopwatchService.formattedTime,
                    isRunning: _stopwatchService.isRunning,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding,
                ),
                child: AdaptiveButtons(
                  state: _stopwatchService.state,
                  onStart: _stopwatchService.start,
                  onPause: _stopwatchService.pause,
                  onResume: _stopwatchService.resume,
                  onReset: _stopwatchService.reset,
                  onLap: _stopwatchService.addLap,
                ),
              ),
              const SizedBox(height: 24),
              if (_stopwatchService.laps.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'LAPS',
                        style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${_stopwatchService.lapCount}',
                        style: const TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 8),
              if (_stopwatchService.laps.isNotEmpty)
                const SizedBox(height: 4),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding,
                  ),
                  child: LapList(laps: _stopwatchService.laps),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

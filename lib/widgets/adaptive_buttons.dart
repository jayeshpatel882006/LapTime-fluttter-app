import 'package:flutter/material.dart';

import '../services/stopwatch_service.dart';
import '../utils/constants.dart';
import '../utils/theme.dart';

class AdaptiveButtons extends StatelessWidget {
  final StopwatchState state;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onResume;
  final VoidCallback onReset;
  final VoidCallback onLap;

  const AdaptiveButtons({
    super.key,
    required this.state,
    required this.onStart,
    required this.onPause,
    required this.onResume,
    required this.onReset,
    required this.onLap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: AppConstants.animationDuration,
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: _buildLeftButton(),
        ),
        const SizedBox(width: AppConstants.buttonSpacing),
        AnimatedSwitcher(
          duration: AppConstants.animationDuration,
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: _buildRightButton(),
        ),
      ],
    );
  }

  Widget _buildLeftButton() {
    switch (state) {
      case StopwatchState.initial:
        return _buildCircularButton(
          key: const ValueKey('start'),
          label: 'Start',
          icon: Icons.play_arrow_rounded,
          onPressed: onStart,
          color: AppColors.primary,
          shadowColor: AppColors.primary,
        );
      case StopwatchState.running:
        return _buildCircularButton(
          key: const ValueKey('pause'),
          label: 'Pause',
          icon: Icons.pause_rounded,
          onPressed: onPause,
          color: AppColors.warning,
          shadowColor: AppColors.warning,
        );
      case StopwatchState.paused:
        return _buildCircularButton(
          key: const ValueKey('resume'),
          label: 'Resume',
          icon: Icons.play_arrow_rounded,
          onPressed: onResume,
          color: AppColors.primary,
          shadowColor: AppColors.primary,
        );
    }
  }

  Widget _buildRightButton() {
    switch (state) {
      case StopwatchState.initial:
        return _buildCircularButton(
          key: const ValueKey('reset_disabled'),
          label: 'Reset',
          icon: Icons.replay_rounded,
          onPressed: null,
          color: AppColors.disabled,
          shadowColor: Colors.transparent,
        );
      case StopwatchState.running:
        return _buildCircularButton(
          key: const ValueKey('lap'),
          label: 'Lap',
          icon: Icons.flag_rounded,
          onPressed: onLap,
          color: AppColors.secondary,
          shadowColor: AppColors.secondary,
        );
      case StopwatchState.paused:
        return _buildCircularButton(
          key: const ValueKey('reset'),
          label: 'Reset',
          icon: Icons.replay_rounded,
          onPressed: onReset,
          color: AppColors.reset,
          shadowColor: AppColors.reset,
        );
    }
  }

  Widget _buildCircularButton({
    required ValueKey key,
    required String label,
    required IconData icon,
    required VoidCallback? onPressed,
    required Color color,
    required Color shadowColor,
  }) {
    final bool isEnabled = onPressed != null;

    return Column(
      key: key,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: AppConstants.buttonSize,
          height: AppConstants.buttonSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: isEnabled
                ? [
                    BoxShadow(
                      color: shadowColor.withValues(alpha: 0.3),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Material(
            color: color,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: isEnabled ? onPressed : null,
              customBorder: const CircleBorder(),
              splashColor: Colors.white.withValues(alpha: 0.15),
              highlightColor: Colors.white.withValues(alpha: 0.05),
              child: Icon(
                icon,
                size: AppConstants.buttonIconSize,
                color: isEnabled ? Colors.white : AppColors.textTertiary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isEnabled ? AppColors.textSecondary : AppColors.textTertiary,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

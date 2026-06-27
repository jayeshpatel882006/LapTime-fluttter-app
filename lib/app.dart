import 'package:flutter/material.dart';

import 'screens/stopwatch_screen.dart';
import 'utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LapTime',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const StopwatchScreen(),
    );
  }
}

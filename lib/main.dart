import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:test_application/ui/theme/app_theme.dart';
import 'pages/home/home.dart';

void main() {
  runZonedGuarded(() {
    runApp(const MoodDiary());
  }, (error, stackTrace) {
    log('Произошла ошибка: $error');
  });
}

class MoodDiary extends StatelessWidget {
  const MoodDiary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spotify/core/configs/app_theme.dart';
import 'package:spotify/presentation/pages/splash/splash.dart';

void main() {
  runApp(const Spotify());
}

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}

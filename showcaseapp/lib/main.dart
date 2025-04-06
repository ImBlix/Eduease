import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'widgets/showcase_screen.dart';

void main() {
  runApp(const EduEaseShowcaseApp());
}

class EduEaseShowcaseApp extends StatelessWidget {
  const EduEaseShowcaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduEase Component Showcase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Arial',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          displayMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          bodyLarge: TextStyle(fontSize: 16, color: AppColors.primary),
          bodyMedium: TextStyle(fontSize: 14, color: AppColors.secondaryText),
        ),
      ),
      home: const ShowcaseScreen(),
    );
  }
}

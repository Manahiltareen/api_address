import 'package:api_address/config/app_colors.dart';
import 'package:api_address/config/font_utils.dart';
import 'package:api_address/config/go_router.dart';
import 'package:flutter/material.dart';
 // Import your GoRouter config

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( // Use MaterialApp.router for GoRouter
      title: 'Address App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, // Can be refined using AppColors.primaryBlue
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto', // Or a custom font declared in pubspec.yaml
        scaffoldBackgroundColor: AppColors.lightBackground, // Use a global background color
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.darkGrey),
          titleTextStyle: FontUtils.appBarTitle,
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
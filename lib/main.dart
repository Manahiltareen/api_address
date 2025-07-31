import 'package:api_address/config/app_colors.dart';
import 'package:api_address/config/font_utils.dart';
import 'package:api_address/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Address App',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // initialRoute: Routes.login,
      // getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.darkGrey),
          titleTextStyle: FontUtils.appBarTitle,
        ),
      ),
    );
  }
}

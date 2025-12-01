import 'package:flutter/material.dart';
import 'utils/colors.dart';
import '/screens/home/main_navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Reservation App',
      theme: ThemeData(
        primaryColor: AppColors.maroon,
        scaffoldBackgroundColor: AppColors.bgWhite,
      ),
      home: const MainNavigationPage(),
    );
  }
}

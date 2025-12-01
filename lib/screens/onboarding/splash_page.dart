import 'package:flutter/material.dart';
import '/utils/colors.dart';
import '/screens/home/home_page.dart'; // ganti path sesuai struktur kamu

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _scale = 0.6;
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    // Jalankan animasi setelah build
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _scale = 1.0;
        _opacity = 1.0;
      });
    });

    // Navigate ke HomePage
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (_, animation, __) => FadeTransition(
            opacity: animation,
            child: const HomePage(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.maroon,
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeOutBack,
          width: 200 * _scale,
          height: 200 * _scale,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 900),
            opacity: _opacity,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                  )
                ],
              ),
              child: Center(
                child: Text(
                  "HOTEL+",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maroon,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

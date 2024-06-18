import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ha9i/theme/theme.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const Ha9i());
}

class Ha9i extends StatelessWidget {
  const Ha9i({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/welcome/welcome.dart';

void main() {
  runApp(Ha9i());
}

class Ha9i extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        useMaterial3: true, 
      ),
      home: WelcomePage(),
    );
  }
}

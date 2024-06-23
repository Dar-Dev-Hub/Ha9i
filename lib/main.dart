import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ha9i/screens/app/about_lawyer.dart';
import 'package:ha9i/screens/app/home_screen.dart';
import 'package:ha9i/screens/app/lawyers_page.dart';
import 'package:ha9i/screens/auth/get_started.dart';
import 'package:ha9i/screens/onboarding/onboarding_view.dart';
import 'package:ha9i/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage().write('onboarding', false);
  await GetStorage.init();
  bool onboarding = GetStorage().read('onboarding') ?? false;
  runApp(Ha9i(onboarding: onboarding));
}

class Ha9i extends StatelessWidget {
  final bool onboarding;

  const Ha9i({super.key, required this.onboarding});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: onboarding ? const GetStarted() : const OnboardingView(),
      // home: ProfilePage(),
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/lawyers', page: () => LawyersListPage()),
      ],
    );
  }
}

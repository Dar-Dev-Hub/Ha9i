import 'package:flutter/material.dart';
import 'package:ha9i/screens/auth/login_page.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/back_get.jpg'), // Background image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(0, 117, 90, 90), Color(0xFF111122)],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 14),
                  const Text(
                    'Welcome to Ha9i.',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(flex: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 100, // Adjust width as needed
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              backgroundColor: Colors.white, // Background color
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8), // Button padding
                            ),
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Color(0xFFF54141)), // Text color
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 100, // Adjust width as needed
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              backgroundColor:
                                  const Color(0xFFF54141), // Background color
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8), // Button padding
                            ),
                            child: const Text(
                              "Log in",
                              style:
                                  TextStyle(color: Colors.white), // Text color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

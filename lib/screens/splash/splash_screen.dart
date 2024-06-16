import 'package:flutter/material.dart';

import '../auth/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: _onPageChanged,
        children: [
          _buildPage(
            context,
            'All your legal needs, expertly handled right here.',
            'Ha9i is available to complete your needs but can save your time too',
            'assets/images/back.jpg',
          ),
          _buildPage(
            context,
            'Legal services made simple.',
            'Ha9i ensures you get the best legal support effortlessly.',
            'assets/images/back1.jpg', // Second page background image
          ),
          _buildPage(
            context,
            'Your trusted legal partner.',
            'Ha9i provides reliable and affordable legal solutions.',
            'assets/images/back2.png', // Third page background image
            isLastPage: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPage(
      BuildContext context, String title, String subtitle, String imagePath,
      {bool isLastPage = false}) {
    return Stack(
      children: [
        SizedBox(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
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
              colors: [Colors.transparent, Color(0xFF111122)],
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
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const Spacer(flex: 2),
                if (isLastPage)
                  Center(
                    child: SizedBox(
                      width: 100, // Adjust width as needed
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GetStarted(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          backgroundColor: Colors.white, // Background color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8), // Button padding
                        ),
                        child: const Text(
                          "Get Started",
                          style:
                              TextStyle(color: Color(0xFFF54141)), // Text color
                        ),
                      ),
                    ),
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentPage > 0)
                        SizedBox(
                          width: 100, // Adjust width as needed
                          child: ElevatedButton(
                            onPressed: () {
                              _pageController.previousPage(
                                duration: const Duration(
                                    milliseconds: 500), // Increased duration
                                curve: Curves.ease, // Smooth curve
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
                              "Previous",
                              style: TextStyle(
                                  color: Color(0xFFF54141)), // Text color
                            ),
                          ),
                        ),
                      const Spacer(), // Add spacer to push the "Next" button to the right
                      SizedBox(
                        width: 100, // Adjust width as needed
                        child: ElevatedButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(
                                  milliseconds: 500), // Increased duration
                              curve: Curves.ease, // Smooth curve
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            backgroundColor: Colors.white, // Background color
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8), // Button padding
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(
                                color: Color(0xFFF54141)), // Text color
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

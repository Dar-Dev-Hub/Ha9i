import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ha9i/screens/auth/get_started.dart';
import 'package:ha9i/screens/onboarding/components/colors.dart';
import 'package:ha9i/screens/onboarding/onboarding_items.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;
  final storage = GetStorage();

  @override
  void initState() {
    super.initState();
    if (storage.read('onboarding') == true) {
      // If onboarding has been completed, navigate to GetStarted screen
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const GetStarted()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLastPage
            ? getStarted()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100, // Adjust width as needed
                    child: ElevatedButton(
                      onPressed: () {
                        pageController.nextPage(
                          duration: const Duration(
                              milliseconds: 500), // Increased duration
                          curve: Curves.ease, // Smooth curve
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        backgroundColor: const Color.fromARGB(
                            255, 224, 41, 41), // Background color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8), // Button padding
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Color.fromARGB(
                                255, 255, 255, 255)), // Text color
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: controller.items.length,
                    onDotClicked: (index) => pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn,
                    ),
                    effect: const WormEffect(
                      dotColor: Color.fromARGB(43, 0, 0, 0),
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: Color.fromARGB(255, 230, 42, 42),
                    ),
                  ),
                ],
              ),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: PageView.builder(
              onPageChanged: (index) => setState(
                  () => isLastPage = controller.items.length - 1 == index),
              itemCount: controller.items.length,
              controller: pageController,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(controller.items[index].image),
                    const SizedBox(height: 15),
                    Text(
                      controller.items[index].title,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 230, 42, 42)),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 345,
                      child: Text(
                        controller.items[index].descriptions,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 17),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          if (!isLastPage)
            Positioned(
              top: 46,
              right: 0,
              child: SizedBox(
                width: 100, // Adjust width as needed
                child: ElevatedButton(
                  onPressed: () =>
                      pageController.jumpToPage(controller.items.length - 1),
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    backgroundColor: const Color.fromARGB(
                        255, 255, 255, 255), // Background color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8), // Button padding
                  ),
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                        color: Color.fromARGB(255, 230, 42, 42),
                        fontSize: 16,
                        fontWeight: FontWeight.bold), // Text color
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget getStarted() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryColor,
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        onPressed: () {
          storage.write('onboarding', true);
          if (!mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const GetStarted()),
          );
        },
        child: const Text(
          "Get started",
          style: TextStyle(color: Color(0xFFF54141)), // Text color
        ),
      ),
    );
  }
}

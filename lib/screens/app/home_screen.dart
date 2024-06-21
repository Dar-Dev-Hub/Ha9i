import 'package:flutter/material.dart';
import 'package:ha9i/shared/app_widgets/drawer.dart';
import 'package:ha9i/shared/app_widgets/navbar.dart';
import 'package:ha9i/shared/widgets/lawyer_card.dart';
import 'package:ha9i/shared/app_widgets/appbar.dart';
import 'package:ha9i/shared/widgets/area_of_low_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      drawer: const DrawerFb1(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.02),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Lawyers',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 219, 18, 18),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 6,
                itemBuilder: (context, index) {
                  if (index == 5) {
                    return Transform.scale(
                      scale: _currentPage == index ? 1.0 : 0.85,
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Show All',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 219, 18, 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    bool isCenter = index == _currentPage;
                    return Transform.scale(
                      scale: isCenter ? 1.0 : 0.85,
                      child: LawyerCard(
                        name: 'Khaled Ben Abderrahmen',
                        expertise: index == 0
                            ? 'Personal status law'
                            : 'Administrative law',
                        experience: '${8 + index} Exp Years',
                        imageUrl: 'https://via.placeholder.com/150',
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: height * 0.04),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Areas Of Law',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 219, 18, 18),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AreaOfLawCard(
                    title: 'Labor',
                    icon: Icons.work,
                  ),
                  AreaOfLawCard(
                    title: 'Personal status',
                    icon: Icons.person,
                  ),
                  AreaOfLawCard(
                    title: 'Execution',
                    icon: Icons.gavel,
                  ),
                  AreaOfLawCard(
                    title: 'Criminal',
                    icon: Icons.local_police,
                  ),
                  AreaOfLawCard(
                    title: 'Administrative',
                    icon: Icons.admin_panel_settings,
                  ),
                  AreaOfLawCard(
                    title: 'Show All',
                    icon: Icons.view_list,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}

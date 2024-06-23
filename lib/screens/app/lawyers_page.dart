import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ha9i/models/lawyer.dart';
import 'package:ha9i/screens/app/about_lawyer.dart';
import 'package:ha9i/shared/global_widgets/appbar.dart';
import 'package:ha9i/shared/global_widgets/navbar.dart';
import 'package:ha9i/shared/widgets/lawyer_card2.dart';

class LawyersListPage extends StatelessWidget {
  final List<Lawyer> lawyers = [
    Lawyer(
      name: 'Khaled Ben Abderahmen',
      field: 'Labor Law',
      experience: '10 Exp Years',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Lawyer(
      name: 'Khaled Ben Abderahmen',
      field: 'Labor Law',
      experience: '22 Years Exp',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Lawyer(
      name: 'Khaled Ben Abderahmen',
      field: 'Labor Law',
      experience: '15 Years Exp',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Lawyer(
      name: 'Khaled Ben Abderahmen',
      field: 'Labor Law',
      experience: '12 Years Exp',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Lawyer(
      name: 'Khaled Ben Abderahmen',
      field: 'Administrative Law',
      experience: '7 Years Exp',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: ListView.builder(
        itemCount: lawyers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Get.to(() => ProfilePage());
              }, child: LawyerCard2(lawyer: lawyers[index]));
        },
      ),
      bottomNavigationBar: const MyNavBar(
        selectedIndex: 0,
      ),
    );
  }
}

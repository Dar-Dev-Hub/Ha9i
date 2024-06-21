import 'package:flutter/material.dart';

class AreaOfLawCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const AreaOfLawCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        width: width * 0.2,
        height: height * 0.13,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            SizedBox(height: height * 0.01),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

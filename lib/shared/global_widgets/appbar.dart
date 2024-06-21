import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final Size preferredSize;

  const MyAppBar({super.key})
      : preferredSize = const Size.fromHeight(56.0);
  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.white;

    return AppBar(
      foregroundColor: primaryColor,
      shadowColor: primaryColor,
      
      title: const Center(
          child: Text("Ha9i",
              style: TextStyle(color: Color.fromARGB(255, 219, 18, 18)))),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 219, 18, 18),
          ),
          onPressed: () {},
        )
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Color.fromARGB(255, 219, 18, 18),
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}

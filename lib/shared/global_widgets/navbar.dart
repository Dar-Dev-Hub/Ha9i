import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  final primaryColor = const Color.fromARGB(255, 255, 255, 255);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color.fromARGB(255, 128, 7, 7);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BottomAppBar(
      elevation: 1,
      padding: const EdgeInsets.only(top: 1, bottom: 15, left: 10, right: 10),
      height: height * 0.1,
      color: Colors.white,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconBottomBar(
                  text: "Home",
                  icon: Icons.home,
                  selected: true,
                  onPressed: () {}),
              IconBottomBar(
                  text: "History",
                  icon: Icons.history,
                  selected: false,
                  onPressed: () {}),
              IconBottomBar(
                  text: "Add",
                  icon: Icons.add,
                  selected: false,
                  onPressed: () {}),
              IconBottomBar(
                  text: "Chat",
                  icon: Icons.chat_bubble_outline,
                  selected: false,
                  onPressed: () {}),
              IconBottomBar(
                  text: "Cases",
                  icon: Icons.edit_document,
                  selected: false,
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {super.key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed});
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color.fromARGB(255, 219, 18, 18);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon:
              Icon(icon, size: 25, color: selected ? accentColor : Colors.grey),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected ? accentColor : Colors.grey),
        )
      ],
    );
  }
}

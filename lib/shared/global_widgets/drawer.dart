import 'package:flutter/material.dart';

class DrawerFb1 extends StatelessWidget {
  const DrawerFb1({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 199, 97, 97),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(height: height * 0.05),
                  SizedBox(height: height * 0.05),
                  MenuItem(
                    text: 'Account Settings',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  SizedBox(height: height * 0.01),
                  MenuItem(
                    text: 'My wallet',
                    icon: Icons.wallet,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  SizedBox(height: height * 0.01),
                  MenuItem(
                    text: 'Laws description',
                    icon: Icons.description,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  SizedBox(height: height * 0.01),
                  MenuItem(
                    text: 'support team',
                    icon: Icons.support_agent_outlined,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  SizedBox(height: height * 0.01),
                  MenuItem(
                    text: 'privacy policy',
                    icon: Icons.privacy_tip,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  SizedBox(height: height * 0.01),
                  MenuItem(
                    text: 'support team',
                    icon: Icons.support_agent_outlined,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  SizedBox(height: height * 0.01),
                  MenuItem(
                    text: 'English',
                    icon: Icons.language,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  SizedBox(height: height * 0.01),
                  MenuItem(
                    text: 'Face ID',
                    icon: Icons.face,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  SizedBox(height: height * 0.11),
                  const Divider(color: Colors.white70),
                  SizedBox(height: height * 0.01),
                  MenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Scaffold(), // Page 1
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Scaffold(), // Page 2
        ));
        break;
    }
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    this.onClicked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

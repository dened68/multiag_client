import 'package:flutter/material.dart';
import 'package:multiag_client/pages/mypage.dart';
import 'package:multiag_client/pages/home.dart';

class Drawerstatelesswidget extends StatelessWidget {
  const Drawerstatelesswidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Заказы'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Мои заказы'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/todo');
            },
          ),
        ],
      ),
    );
  }
}

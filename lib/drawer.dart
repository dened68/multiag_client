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
            child: Text(""),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(
                      'http://dmsolution.ru/cache/com_unitehcarousel/01_285x115_exact_images-logo.jpg')),
              color: Colors.white,
            ),
          ),
          ListTile(
            title: const Text(
              'Заказы',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Мои заказы', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/todo');
            },
          ),
        ],
      ),
    );
  }
}

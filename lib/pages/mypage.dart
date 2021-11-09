import 'package:flutter/material.dart';
import 'package:multiag_client/drawer.dart';

class Mypage extends StatefulWidget {
  Mypage({Key? key}) : super(key: key);

  @override
  _MypageState createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Список заказов"),
      ),
      drawer: Drawerstatelesswidget(),
    );
  }
}

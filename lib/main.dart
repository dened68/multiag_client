import 'package:flutter/material.dart';
import 'package:multiag_client/pages/home.dart';
import 'package:multiag_client/pages/mypage.dart';

void main() {
  runApp(MaterialApp(
    title: "Мультиагентная система",
    theme: ThemeData.light(),

    //pages
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/todo': (context) => Mypage(),
    },
  ));
}

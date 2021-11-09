import 'package:flutter/material.dart';

import 'package:multiag_client/drawer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Список заказов"),
        ),
        drawer: Drawerstatelesswidget(),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(100, (index) {
            return Center(child: CadrStatelessWidget());
          }),
        ));
  }
}

//list item

class CadrStatelessWidget extends StatelessWidget {
  const CadrStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 170,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.blue[200],
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 3.0,
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

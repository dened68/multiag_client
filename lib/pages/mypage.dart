// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:multiag_client/drawer.dart';
import 'package:multiag_client/objects/Order.dart';
import 'package:multiag_client/objects/User.dart';
import 'package:multiag_client/pages/orderpage.dart';

import 'package:http/http.dart' as http;

class Mypage extends StatefulWidget {
  Mypage({Key? key}) : super(key: key);

  @override
  _MypageState createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  late Future<List<Order>> orders;
  late Future<User> user;
  bool userIsLoading = false;
  bool ordersIsLoading = false;

  @override
  void initState() {
    super.initState();
    user = fetchUser();
    orders = fetchOrders();
  }

  Future userLoad() async {
    setState(() => userIsLoading = true);

    user = fetchUser();

    setState(() => userIsLoading = false);
  }

  Future solaryLoad() async {
    setState(() => ordersIsLoading = true);

    user = fetchUser();

    setState(() => ordersIsLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawerstatelesswidget(),
        appBar: AppBar(
          title: Text("Мои заказы"),
        ),
        body: Column(
          children: [
            // user info
            Expanded(
                // decoration: BoxDecoration(
                //   color: Colors.white,
                // ),
                // height: 190,
                child: userIsLoading
                    ? CircularProgressIndicator()
                    : Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(""),
                            // icon + name + special
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _UserIcon(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FutureBuilder<User>(
                                          future: user,
                                          builder: (context, snapshot) {
                                            return (snapshot.data == null)
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator())
                                                : Container(
                                                    child: Text(
                                                      snapshot.data!.FirstName +
                                                          " " +
                                                          snapshot
                                                              .data!.SecondName,
                                                      style: TextStyle(
                                                          fontSize: 25),
                                                    ),
                                                  );
                                          }),
                                      Text(
                                        "Это он в будущем(Токарь)",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[700]),
                                      )
                                    ],
                                  )
                                ]),
                            // solary + hours
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 12, 0, 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      FutureBuilder<User>(
                                          future: user,
                                          builder: (context, snapshot) {
                                            return (snapshot.data == null)
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator())
                                                : Container(
                                                    child: Text(
                                                      "${snapshot.data!.id}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 25),
                                                    ),
                                                  );
                                          }),
                                      Text(
                                        "ID",
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      FutureBuilder<User>(
                                          future: user,
                                          builder: (context, snapshot) {
                                            return (snapshot.data == null)
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator())
                                                : Container(
                                                    child: Text(
                                                      "${snapshot.data!.salary}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 25),
                                                    ),
                                                  );
                                          }),
                                      Text(
                                        "Заработано",
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),

            //item list
            Expanded(
                flex: 2,
                child: ordersIsLoading
                    ? CircularProgressIndicator()
                    : Container(
                        color: Colors.grey[200],
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 1),
                        child: FutureBuilder<List<Order>>(
                          future: orders,
                          builder: (context, snapshot) {
                            return (snapshot.data == null)
                                ? Center(child: CircularProgressIndicator())
                                : ListView.separated(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return _Item(
                                        order: snapshot.data![index],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const Divider(),
                                  );
                          },
                        ),
                      ))
          ],
        ));
  }
}

class _UserIcon extends StatelessWidget {
  const _UserIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: Image(
              image: AssetImage("assets/User.png"),
            ),
          )),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({Key? key, required Order this.order})
      : super(
          key: key,
        );

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Orderpage(order: order)));
            },
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(order.ImageUrl),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2), // changes position of shadow
                      // changes position of shadow
                    ),
                  ],
                ),
                height: 150,
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          order.InstrumentName,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Text(order.TechnicalProcessName,
                            style: TextStyle(fontSize: 23)),
                        Row(
                          children: [
                            Icon(
                              Icons.attach_money_sharp,
                              size: 25,
                              color: Colors.blue[700],
                            ),
                            Text(
                              "${order.Price}",
                              style: TextStyle(fontSize: 23),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                )))));
  }
}

Future<List<Order>> fetchOrders() async {
  List<Order> orders;

  var response =
      await http.get(Uri.parse("http://10.0.2.2:3001/orders/active"));
  var a = response.statusCode;
  orders = (json.decode(response.body) as List)
      .map((i) => Order.fromJson(i))
      .toList();
  return orders;
}

Future<User> fetchUser() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:3001/user'));

  return User.fromJson(jsonDecode(response.body));
}

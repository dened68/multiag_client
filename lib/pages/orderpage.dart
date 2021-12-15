import 'dart:ffi';

import 'package:multiag_client/objects/Order.dart';
import 'package:multiag_client/objects/User.dart';
import 'package:flutter/material.dart';

class Orderpage extends StatelessWidget {
  const Orderpage({Key? key, required Order this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(
                  order.ImageUrl,
                ),
                alignment: Alignment.topCenter),
          ),
          child: Padding(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                //first block
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 310, 10, 10),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 2), // changes position of shadow
                            // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              ("№ ${order.id}"),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(order.InstrumentName,
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(order.TechnicalProcessName,
                                style: TextStyle(
                                  fontSize: 22,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(00, 25, 00, 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.attach_money_sharp,
                                  size: 32,
                                  color: Colors.blue[700],
                                ),
                                Text(
                                  "${order.Price}",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timelapse,
                                        color: Colors.grey[800],
                                      ),
                                      Text("25 мин",
                                          style: TextStyle(
                                              color: Colors.grey[800])),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.directions_walk,
                                        color: Colors.grey[800],
                                      ),
                                      Text("25 м",
                                          style: TextStyle(
                                              color: Colors.grey[800])),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.handyman,
                                        color: Colors.grey[800],
                                      ),
                                      Text(
                                        "сверлильный станок",
                                        style:
                                            TextStyle(color: Colors.grey[800]),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ],
                      )),
                ),
                //second block
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 2), // changes position of shadow
                            // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("тут какая нибудь доп информмация"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("И Тут"),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                //button
                Padding(
                  padding: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 4,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                                // changes position of shadow
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(72, 4, 80, 4),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 4,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                                // changes position of shadow
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(80, 4, 72, 4),
                              child: Icon(
                                Icons.cancel_outlined,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

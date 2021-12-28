import 'package:google_fonts/google_fonts.dart';
import 'package:multiag_client/objects/Request.dart';
import 'package:multiag_client/pages/imageViewPage.dart';
import 'package:flutter/material.dart';

class Requestpage extends StatelessWidget {
  const Requestpage({Key? key, required Request this.order}) : super(key: key);
  final Request order;

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
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageViewPage(
                                    url: order.ImageUrl,
                                  )));
                    },
                    child: Container(
                      height: 270,
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0)),
                      child: Row(
                        children: [Text("")],
                      ),
                    ),
                  )),
                ),

                //first block
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 21, 10, 10),
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
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(order.InstrumentName,
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Text(order.TechnicalProcessName,
                                style: TextStyle(
                                  fontSize: 22,
                                )),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.fromLTRB(00, 25, 00, 40),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Text(
                          //         "${order.Price}",
                          //         style: TextStyle(
                          //             fontSize: 30,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       Image(
                          //         image: AssetImage(
                          //           'assets/ruble.png',
                          //         ),
                          //         width: 24,
                          //         height: 24,
                          //       )
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(18, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.timelapse,
                                          color: Colors.grey[800],
                                        ),
                                        Text("10 мин",
                                            style: TextStyle(
                                                color: Colors.grey[800])),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(29, 0, 00, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${order.Price}",
                                          style: TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                        Image(
                                          image: AssetImage(
                                            'assets/ruble.png',
                                          ),
                                          width: 18,
                                          height: 18,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 18, 0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.handyman,
                                          color: Colors.grey[800],
                                        ),
                                        Text(
                                          "Станок №3",
                                          style: TextStyle(
                                              color: Colors.grey[800]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      )),
                ),
                //second block
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
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
                        Text(
                          "Станок",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Вид:",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "Группа:",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "Тип:",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "Название:",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Сверлильный",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "2",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "Настольно-Сверлильный",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "SV_NCV_164G2",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          "Инструмент",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Вид:",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "Группа:",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "Тип:",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "Название:",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "Размер:",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Лезвенный",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "Фреза",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "Прямой",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "BORFREZA-B1020-6MM_2",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                                Text(
                                  "23",
                                  style: GoogleFonts.jura(
                                    fontSize: 23,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
                            color: Colors.green[400],
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
                            color: Colors.deepOrange[900],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 4,
                                blurRadius: 4,
                                offset: Offset(0, 2),
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

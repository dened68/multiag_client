import 'package:flutter/material.dart';
import 'package:multiag_client/objects/Request.dart';
import 'package:multiag_client/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:multiag_client/pages/requestpage.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Request>> request;
  bool requestIsLoad = false;

  @override
  void initState() {
    super.initState();

    request = fetchRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerstatelesswidget(),
      appBar: AppBar(
        title: Text("Список запросов"),
      ),

      body: FutureBuilder<List<Request>>(
        future: request,
        builder: (context, snapshot) {
          return ((snapshot.data == null)
              ? Center(child: CircularProgressIndicator())
              : GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(snapshot.data!.length, (index) {
                    return Center(
                        child: _CadrStatelessWidget(
                      request: snapshot.data![index],
                    ));
                  }),
                ));
        },
      ),
      // GridView.count(
      //   crossAxisCount: 2,
      //   children: List.generate(100, (index) {
      //     return Center(child: _CadrStatelessWidget());
      //   }),
      // )
    );
  }
}

// item

class _CadrStatelessWidget extends StatelessWidget {
  const _CadrStatelessWidget({Key? key, required Request this.request})
      : super(key: key);
  final Request request;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Requestpage(order: request)));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 6, 4, 4),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(request.ImageUrl),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.blue[200],
            boxShadow: [
              new BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
              ),
            ],
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      request.InstrumentName,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      request.TechnicalProcessName,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.attach_money_sharp,
                      size: 17,
                      color: Colors.blue[700],
                    ),
                    Text(
                      "${request.Price}",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<Request>> fetchRequests() async {
  List<Request> requests;

  var response = await http.get(Uri.parse("http://10.0.2.2:3001/requests"));
  var a = response.statusCode;
  requests = (json.decode(response.body) as List)
      .map((i) => Request.fromJson(i))
      .toList();
  return requests;
}

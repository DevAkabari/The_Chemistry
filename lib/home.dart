import 'dart:convert';

import 'package:elements_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Periodic_Table.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    final gridList = rootBundle
        .loadString('assets/elementsGrid.json')
        .then((source) => jsonDecode(source)['elements'] as List)
        .then((list) => list
            .map((json) => json != null ? ElementData.fromJson(json) : null)
            .toList());
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 248, 255, 247),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(children: [
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      // barrierColor: Colors.black12.withOpacity(0.1),
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        title: Text("about this app"),
                      ),
                    );
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 8.5),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryGreen),
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      "i",
                      style: TextStyle(color: primaryGreen),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ElementsApp(gridList)));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 249, 255, 249),
                    // border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                          color:
                              Color.fromARGB(255, 10, 155, 10).withOpacity(.05),
                          offset: Offset(0, 0),
                          blurRadius: 20,
                          spreadRadius: 3)
                    ],
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/periodic-table.png',
                      height: 80,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Periodic Table",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: primaryGreen),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Periodic Table with details\nof elements",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: primaryGreen),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

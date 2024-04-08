import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/AddScreen.dart';
import 'utils/mainScreen.dart';

void main() {
  (runApp(MaterialApp(
    home: MyApp(),
  )
      // const MyApp()
      ));
}

class MyApp extends StatefulWidget {
  
  MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List taskitems = ["jeeban"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TODO LIST APP",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "TODO LIST",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, right: 6, left: 6),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return AddItem(
                textname: taskitems[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
            itemCount: taskitems.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddScreen(
                      item: taskitems,
                    )));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

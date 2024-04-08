import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import 'package:todolist/utils/mainScreen.dart';

class AddScreen extends StatefulWidget {
  List item;

  AddScreen({
    super.key,
    required this.item,
  });

  @override
  State<AddScreen> createState() => _AddItemState();
}

class _AddItemState extends State<AddScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController itemscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "add item",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            "ADD LIST",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        //SizedBox:(height:15),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 6, left: 6),
                child: TextFormField(
                  controller: itemscontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter title";
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      labelText: "Title",
                      filled: true,
                      fillColor: Colors.blue[50]),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 50,
                width: 170,
                child: TextButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      widget.item.add(itemscontroller.text);
                      itemscontroller.text = "";
                    }
                    print(widget.item);
                    //Navigator.of(context).push(MaterialPageRoute(
                    // builder: (context) => MyApp(textname:)));
                  },
                  child: const Text(
                    "ADD",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

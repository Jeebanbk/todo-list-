import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todo_Controller.dart';
import 'package:todolist/main.dart';
import 'package:todolist/model/task.dart';
import 'package:todolist/utils/mainScreen.dart';

class AddScreen extends StatefulWidget {
  bool isEditpage = false;
  int index = 0;
  String task = '';

  AddScreen(
      {super.key, this.isEditpage = false, this.index = 0, this.task = ''});

  @override
  State<AddScreen> createState() => _AddItemState();
}

class _AddItemState extends State<AddScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController itemscontroller = TextEditingController();
  final TodoController todoController = Get.find<TodoController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemscontroller.text = widget.task;
  }

  void addTask() {
    if (_formkey.currentState!.validate()) {
      Task task = Task(itemscontroller.text, false);
      todoController.add(task);
      itemscontroller.text = "";
    }
    Get.back();
  }

  void completedTask() {}

  void updateTask() {
    Task task = todoController.tasks[widget.index];
    task.task = itemscontroller.text;
    todoController.updateTask(widget.index, task);
    Get.back();
  }

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
            icon: const Icon(
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
                    widget.isEditpage ? updateTask() : addTask();
                    widget.isEditpage
                        ? Get.snackbar(widget.task, "Updated successfuly")
                        : Get.snackbar(widget.task, "added successfuly");
                  },
                  child: Text(
                    widget.isEditpage ? "Update" : "Add",
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

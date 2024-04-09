
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'package:todolist/main.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/utils/mainScreen.dart';

class AddScreen extends StatefulWidget {
  bool isEditPage=false;
  int index=0;
  String task='';

  AddScreen({
    super.key,
    this.isEditPage=false,
    this.index=0,
    this.task=''
  });

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
    itemscontroller.text=widget.task;
  }

  void addTask()
  {
      if (_formkey.currentState!.validate()) {
                      Task task =  Task(itemscontroller.text, false);
                      todoController.add(task);
                      itemscontroller.text = "";

                     
                    }
                    Get.back();
  }

  void updateTask()
  {
      Task task = todoController.tasks[widget.index];
      task.task=itemscontroller.text;
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
          title:  Text(
            widget.isEditPage?"Edit Task":"Add Task",
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
              SizedBox(
                height: 50,
                width: 170,
                child: TextButton(
                  onPressed: () {
                    widget.isEditPage?updateTask():addTask();
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  child:  Text(
                    widget.isEditPage?"Update":"Add",
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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

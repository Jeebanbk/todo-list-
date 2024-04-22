import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/AddScreen.dart';
import 'package:todolist/controller/todo_Controller.dart';
import 'utils/mainScreen.dart';
import 'package:get/get.dart';

void main() {
  (runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 // List taskitems = ["jeeban"];
  final TodoController todocontroller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
          child: Obx(() {
            return todocontroller.tasks.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return AddItem(task: todocontroller.tasks[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: todocontroller.tasks.length)
                : const Center(
                    child: Text("No Task Added Yet"),
                  );
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => AddScreen(
            //           item: taskitems,
            //         )));
            Get.to(AddScreen());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

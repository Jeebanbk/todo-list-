import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/AddScreen.dart';
import 'package:todolist/controller/todo_controller.dart';
import 'utils/mainScreen.dart';

void main() {
  (
    runApp(const MyApp()
  )
  );
}

class MyApp extends StatefulWidget {
  
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List taskitems = ["jeeban"];
  final TodoController todoController = Get.put(TodoController());
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
            child:
            
             Obx(() {
              return 
               todoController.tasks.isNotEmpty?
                  ListView.separated(
              itemBuilder: (context, index) {
                return AddItem(
                  task:todoController.tasks[index] ,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 15);
              },
              itemCount: todoController.tasks.length,
            ):const Center(child: Text("No Task Found"),);
            },)
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

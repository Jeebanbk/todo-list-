import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todolist/AddScreen.dart';
import 'package:todolist/controller/todo_Controller.dart';
import 'package:todolist/model/task.dart';

class AddItem extends StatefulWidget {
  Task task;
  AddItem({super.key, required this.task});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController controller = TextEditingController();
  final TodoController todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue[100],
      ),
      child: (Row(
        children: [
          IconButton(
              onPressed: () {
                todoController.toggleTaskStatus(widget.task);
              },
              icon: Icon(
                widget.task.isCompleted
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                //color: Colors.white,
              )),
          Text(
            widget.task.task,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 130,
          ),
          IconButton(
              onPressed: () {
                Get.to(AddScreen(
                  isEditpage: true,
                  index: todoController.tasks.indexOf(widget.task),
                  task: widget.task.task,
                ));
              },
              icon: Icon(
                Icons.edit,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                todoController
                    .delete(todoController.tasks.indexOf(widget.task));
              },
              icon: Icon(
                Icons.delete,
                color: Colors.redAccent,
              )),
        ],
      )),
    );
  }
}

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todolist/model/task.dart';

class TodoController extends GetxController
{
  var tasks = <Task>[].obs;


  void add(Task task){
    tasks.add(task);
    update();
  }
     void updateTask(int index,Task task)
    {
      tasks[index]=task;
      update();
    }

    // delete... 
    // index
    void delete(int index)
    {
      tasks.removeAt(index);
      update();
    }


    //... mark as complete 

    void toggleTaskStatus(Task task)
    {        
        task.isCompleted = !task.isCompleted;
        update();
    }

}

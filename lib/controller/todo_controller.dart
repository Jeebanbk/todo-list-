import 'package:get/state_manager.dart';
import 'package:todolist/models/task.dart';

class TodoController extends GetxController
{
    var tasks = <Task>[].obs;


    // addd...
    void add(Task task)
    {
      tasks.add(task);
      update();
    }


    // edit/update,... 
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
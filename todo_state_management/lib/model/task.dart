

class Task {

  final String taskName;
  bool isDone ;
  Task({required this.taskName , required this.isDone});

  void toggleTask(){
    isDone = !isDone ;
  }



}

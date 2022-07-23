class Todo {
  final int? id;
  final int taskId;
  final String? title;
  final int isDone;

  Todo({required this.id, required this.taskId, this.title, required this.isDone});

   // METHOD TO CREATE MAP OF TASK OBJECT

  Map<String, dynamic> toMap() {
    return {
    'id': id,
    'taskId': taskId,
    'title': title,
    'isDone': isDone,
    };
  }
  // END OF METHOD TO CREATE MAP OF TASK OBJECT

}
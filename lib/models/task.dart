class Task {
  final int? id;
  final String? title;
  final String? description;
  
  Task({this.id, this.title, this.description});
  
  // METHOD TO CREATE MAP OF TASK OBJECT

  Map<String, dynamic> toMap() {
    return {
    'id': id,
    'title': title,
    'description': description,
    };
  }
  // END OF METHOD TO CREATE MAP OF TASK OBJECT

}

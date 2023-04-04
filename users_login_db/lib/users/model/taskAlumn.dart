class TaskAlumn {
  int id;
  String name;
  String description;
  String img;
  int student_id;
  int task_id;
  int? mark;
  String? feedback;

  TaskAlumn(
    this.id,
    this.name,
    this.description,
    this.img,
    this.student_id,
    this.task_id,
    this.mark,
    this.feedback
  );

  factory TaskAlumn.fromJson(Map<String, dynamic> json) => TaskAlumn(
      int.parse(json['id']),
      json['name'],
      json['description'],
      json['img'],
      int.parse(json['student_id']),
      int.parse(json['task_id']),
      int.parse(json['mark']),
      json['feedback']
  );

  Map<String, dynamic> toJson() => {
      'id': id.toString(),
      'name': name,
      'description': description,
      'img': img,
      'student_id': student_id.toString(),
      'task_id': task_id.toString(),
      'mark': mark.toString(),
      'feedback': feedback
  };
}

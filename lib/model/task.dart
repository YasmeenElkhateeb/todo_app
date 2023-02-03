class Task {
  String id;
  String title;
  String description;
  int date;
  bool isDone;

  Task({this.id ='', required this.title,required this.description,required this.date,this.isDone = false});

  Map<String,dynamic> toJson(){  //to firebase
    return {
      "id" : id,
      "title" : title,
      "description" : description,
      "date" : date,
      "isDone": isDone
    };
  }

  // namedConstractor
  Task.fromJson(Map<String,dynamic> json)
  // {
  //       this.id= json['id'] as String;
  //      this.title= json['title'] as String;
  //      this.description= json['description'] as String;
  //       this.date= json['date'] as int;
  //       this.isDone= json['isDone'] as bool;
  //
  // }
      : this(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    date: json['date'] as int,
    isDone: json['isDone'] as bool
  );

}
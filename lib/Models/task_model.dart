class TaskModel{
  String id ;
  String title;
  String description;
  int selectedDate;
  bool isDone;

  TaskModel({this.id='',
  required this.title,
   required this.description,
    required this.selectedDate,
    this.isDone=false});

  TaskModel.fromJson(Map<String,dynamic>json) : this(
  id: json['id'],
    title: json['title'],
    description: json['description'],
    selectedDate: json['selectedDate'],
    isDone: json['isDone']
  );

  Map<String ,dynamic> toJson(){
    return   {  'id': id,
      'title':title,
      'description':description,
      'selectedDate': selectedDate,
      'isDone': isDone,
    };
  }


}
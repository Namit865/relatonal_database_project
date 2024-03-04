class BlogPost {
  int? id;
  String title;
  String content;
  DateTime date;

  BlogPost(
      {required this.content,
      required this.date,
      this.id,
      required this.title});

  Map<String,dynamic> toMap(){
    return {
      'id' : id,
      'title' : title,
      'content' : content,
      'date' : date.toIso8601String(),
    };
  }

  factory BlogPost.fromMap(Map<String, dynamic> map) {
    return BlogPost(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      date: DateTime.parse(map['date']),
    );
  }

}

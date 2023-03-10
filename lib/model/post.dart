class Post {
  String title;
  String body;
  int id;

  Post({required this.title, required this.body, required this.id});

  Map toMap() {
    return {"title": title, "body": body, "id": id};
  }
}

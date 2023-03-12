class Task {
  String title;
  bool complete;

  Task(this.title, this.complete);

  /// Convert from JSON response stream to Favorite object
  Task.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        complete = json['complete'];

  /// Convert an in-memory representation of a Favorite object to a Map<String, dynamic>
  Map<String, dynamic> toJson() => {
        'title': title,
        'complete': complete,
      };
}

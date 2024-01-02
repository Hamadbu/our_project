class Exercises {
  final int? id;
  final String? title;
  final String? file;
  final bool? finished;

  Exercises({
    this.id,
    this.title,
    this.file,
    this.finished,
  });

  Exercises.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        file = json['file'] as String?,
        finished = json['finished'] as bool?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'file': file, 'finished': finished};
}

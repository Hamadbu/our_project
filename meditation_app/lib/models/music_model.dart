class Music {
  final int? id;
  final String? title;
  final String? file;

  Music({
    this.id,
    this.title,
    this.file,
  });

  Music.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        file = json['file'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'file': file};
}

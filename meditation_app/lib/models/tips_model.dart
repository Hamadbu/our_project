import 'dart:convert';

class TipsModel {
  int? id;
  String? text;
  String? author;
  List<int> upvotes = [];
  List<String> downvotes = [];
  TipsModel(
      {this.id,
      this.text,
      this.author,
      required this.upvotes,
      required this.downvotes});
  TipsModel.fromJson(Map json) {
    id = json['id'];
    text = json['text'];
    author = json['author'];
    upvotes = json['upvotes'];
    downvotes = json['downvotes'];
  }
}

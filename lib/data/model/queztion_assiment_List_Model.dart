import 'package:flutter/src/widgets/framework.dart';

class QuestionListModel {
  int? id;
  String? text;
  int? quiz;
  List<Answers>? answers;

  QuestionListModel({this.id, this.text, this.quiz, this.answers});

  QuestionListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    quiz = json['quiz'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['quiz'] = this.quiz;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  int? id;
  String? text;
  bool? correct;
  int? question;

  Answers({this.id, this.text, this.correct, this.question});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    correct = json['correct'];
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['correct'] = this.correct;
    data['question'] = this.question;
    return data;
  }

  map(Widget Function(dynamic e) param0) {}
}
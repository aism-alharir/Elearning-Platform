class Question {
  String? questionText;
  List<AnswersList>? answersList;

  Question({this.questionText, this.answersList});

  Question.fromJson(Map<String, dynamic> json) {
    questionText = json['questionText'];
    if (json['answersList'] != null) {
      answersList = <AnswersList>[];
      json['answersList'].forEach((v) {
        answersList!.add(new AnswersList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionText'] = this.questionText;
    if (this.answersList != null) {
      data['answersList'] = this.answersList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnswersList {
  String? answerText;
  bool? isCorrect;

  AnswersList({this.answerText, this.isCorrect});

  AnswersList.fromJson(Map<String, dynamic> json) {
    answerText = json['answerText'];
    isCorrect = json['isCorrect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answerText'] = this.answerText;
    data['isCorrect'] = this.isCorrect;
    return data;
  }
}


// class Question {
//   final String questionText;
//   final List<Answer> answersList;

//   Question(this.questionText, this.answersList);

//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//       json['questionText'] as String,
//       (json['answersList'] as List<dynamic>)
//           .map((item) => Answer.fromJson(item))
//           .toList(),
//     );
//   }
// }

// class Answer {
//   final String answerText;
//   final bool isCorrect;

//   Answer(this.answerText, this.isCorrect);

//   factory Answer.fromJson(Map<String, dynamic> json) {
//     return Answer(
//       json['answerText'] as String,
//       json['isCorrect'] as bool,
//     );
//   }
// }
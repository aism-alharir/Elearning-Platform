class QuizetionModel {
  int? id;
  String? title;
  String? description;
  int? score;
  int? course;

  QuizetionModel(
      {this.id, this.title, this.description, this.score, this.course});

  QuizetionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    score = json['score'];
    course = json['course'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['score'] = this.score;
    data['course'] = this.course;
    return data;
  }
}
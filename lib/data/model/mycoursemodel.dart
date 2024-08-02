class MyCourseModel {
  int? id;
  int? student;
  Course? course;

  MyCourseModel({this.id, this.student, this.course});

  MyCourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    student = json['student'];
    course =
        json['course'] != null ? new Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student'] = this.student;
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    return data;
  }
}

class Course {
  int? id;
  Instructor? instructor;
  String? image;
  String? title;
  String? description;
  String? price;
  String? startDate;
  String? endDate;
  String? rate;
  int? isFavorite;
  int? category;

  Course(
      {this.id,
      this.instructor,
      this.image,
      this.title,
      this.description,
      this.price,
      this.startDate,
      this.endDate,
      this.rate,
      this.isFavorite,
      this.category});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instructor = json['instructor'] != null
        ? new Instructor.fromJson(json['instructor'])
        : null;
    image = json['image'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    rate = json['rate'];
    isFavorite = json['is_favorite'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.instructor != null) {
      data['instructor'] = this.instructor!.toJson();
    }
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['rate'] = this.rate;
    data['is_favorite'] = this.isFavorite;
    data['category'] = this.category;
    return data;
  }
}

class Instructor {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;

  Instructor(
      {this.id, this.username, this.email, this.firstName, this.lastName});

  Instructor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
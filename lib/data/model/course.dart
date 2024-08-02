import 'package:e_learningplatform/data/model/course_category.dart';
import 'package:e_learningplatform/data/model/section.dart';

class Course {
  late final String _id;
  late final String _title;
  late final String _thumbnailUrl;
  late final String _description;
  late final String _createdBy;
  late final String _createdData;
  late final double _rate;
  late bool _isFavorite;
  late final double _price;
  late final CourseCategory _courseCategory;
  late final String _duration;
  late final int _lessonNo;
  late final List<Section> _section;

  Course(
      this._id,
      this._title,
      this._thumbnailUrl,
      this._description,
      this._createdBy,
      this._createdData,
      this._rate,
      this._price,
      this._isFavorite,
      this._courseCategory,
      this._duration,
      this._lessonNo,
      this._section,
      );

  bool get isFavorite => _isFavorite;
  
  set isFavorite(bool value) {
    _isFavorite = value;
  }

  double get rate => _rate;
  String get createdData => _createdData;
  String get createdBy => _createdBy;
  String get description => _description;
  String get thumbnailUrl => _thumbnailUrl;
  String get title => _title;
  String get id => _id;
  CourseCategory get courseCategory => _courseCategory;
  double get price => _price;
  String get duration => _duration;
  int get lessonNo => _lessonNo;
  List<Section> get section => _section;
}

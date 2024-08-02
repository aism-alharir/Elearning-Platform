import 'package:e_learningplatform/data/model/lecture.dart';

class Section {
  final String _name;
  final List<Lecture> _lectures;
  Section(this._name, this._lectures);

  List<Lecture> get lecture => _lectures;
  String get name => _name;
}

import 'package:e_learningplatform/data/model/course.dart';

class CheckoutArgument {
  final List<Course> _courseList;
  final double _totalPrice;

  CheckoutArgument(this._courseList, this._totalPrice);

  List<Course> get courseList => _courseList;
  double get totalPrice => _totalPrice;
}

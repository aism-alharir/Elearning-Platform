
import 'package:e_learningplatform/data/model/course_model.dart';
import 'package:flutter/material.dart';

class FavoriteOption extends StatefulWidget {
  final CourseModel courseModel;
  const FavoriteOption({super.key, required this.courseModel});

  @override
  State<FavoriteOption> createState() => _FavoriteOptionState();
}

class _FavoriteOptionState extends State<FavoriteOption> {
  bool isFavorite = false;

  @override
  void initState() {
    // isFavorite = widget.courseModel.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
            // widget.courseModel.isFavorite = isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.pink,
        ));
  }
}

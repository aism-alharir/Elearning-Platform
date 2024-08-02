import 'package:e_learningplatform/controller/details/details_controller.dart';
import 'package:e_learningplatform/data/model/section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildCourseContent extends GetView<CourseDetailsController> {
  final int index;
  const BuildCourseContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Section section =controller.course.section[index];
    return ExpansionTile(
      title: Text(
        "Section ${index + 1} - ${section.name}",
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: section.lecture.map((lecture) {
        return ListTile(
          dense: true,
          onTap: () {},
          leading: const SizedBox(),
          title: Text(lecture.name),
          subtitle: Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                lecture.duration,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

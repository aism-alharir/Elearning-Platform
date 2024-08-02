import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/data/model/course_category.dart';
import 'package:e_learningplatform/view/notifier/course_category_change_notifer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    var category = Provider.of<CourseCategoryChangeNotifier>(context).category;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: CourseCategory.values.length,
            itemBuilder: (context, index) {
              CourseCategory courseCategory = CourseCategory.values[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    Provider.of<CourseCategoryChangeNotifier>(context,
                            listen: false)
                        .changeCategory(courseCategory);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: category == courseCategory
                            ? AppColor.kPrimaryColor
                            : Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade800,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        courseCategory.title,
                        style: TextStyle(
                            color: category == courseCategory
                                ? Colors.white
                                : Colors.black,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

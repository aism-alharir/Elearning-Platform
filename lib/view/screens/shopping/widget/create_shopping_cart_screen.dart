import 'package:e_learningplatform/controller/shopping_cart_screen_controller.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/data/datasource/static/data_provider/shopping_cart_data_provider.dart';
import 'package:e_learningplatform/data/model/course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateShoppingCartScrrenItems
    extends GetView<ShoppingCartScreenController> {
  final int index;
  const CreateShoppingCartScrrenItems({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Course course = controller.cartCourseList[index];
    return Card(
      child: ListTile(
        leading: Image.asset(
          course.thumbnailUrl,
          width: 80,
        ),
        title: Text(
          course.title,
          maxLines: 2,
          style: TextStyle(fontSize: 17, color: Colors.grey.shade800),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "By ${course.createdBy}",
              style: const TextStyle(fontSize: 13, color: AppColor.kBlueColor),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  course.duration,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 3,
                  child: Container(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${course.lessonNo} Lessons",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${course.price}"),
            InkWell(
              onTap: () {
                controller.deleteCourseFromShopping();
                // setState(() {
                //   ShoppingCartDataProvider.deleteCourse(course);
                // });
              },
              child: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}

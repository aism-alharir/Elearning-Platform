import 'package:e_learningplatform/controller/myCourses/my_course_controller.dart';
import 'package:e_learningplatform/data/model/mycoursemodel.dart';
import 'package:e_learningplatform/view/screens/mycourses/post/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGetMyCourses extends GetView<MyCourseController> {
  final MyCourseModel myCourseModel;
  const CustomGetMyCourses({super.key, required this.myCourseModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: InkWell(
            onTap: () {
              controller.goToVideo(myCourseModel.course!.id.toString());
            },
            child: Image.network(
              "${myCourseModel.course!.image}",
              fit: BoxFit.cover,
              width: 100,
              height: 250,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "${myCourseModel.course!.title}",
              style: TextStyle(fontSize: 17, color: Colors.grey.shade800),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${myCourseModel.course!.instructor}",
                style: TextStyle(color: Colors.grey.shade500),
              ),
              const SizedBox(
                height: 10,
              ),

              // Visibility(
              //     visible: myCourse.progress > 0,
              //     replacement: const Text(
              //       "Start Course",
              //       style: TextStyle(
              //           color: AppColor.kBlueColor,
              //           fontWeight: FontWeight.bold),
              //     ),
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: SliderTheme(
              //             data: SliderThemeData(
              //               trackHeight: 3,
              //               thumbColor: Colors.transparent,
              //               overlayShape: SliderComponentShape.noThumb,
              //               thumbShape: SliderComponentShape.noThumb,
              //             ),
              //             child: Slider(
              //               min: 0,
              //               max: 100,
              //               value: myCourse.progress.toDouble(),
              //               onChanged: (value) {},
              //             ),
              //           ),
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         Text("${myCourse.progress}%")
              //       ],
              //     ),),
            ],
          ),
          trailing: Wrap(
            direction: Axis.horizontal,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Post(courseid: myCourseModel.course!.id.toString()),
                    ));
                    // Get.to(Post(
                    //     courseid: myCourseModel.course!.id.toString()));
                  },
                  icon: const Icon(
                    Icons.post_add,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    controller
                        .goToAssimentList(myCourseModel.course!.id.toString());
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) =>
                    //       Post(courseid: myCourseModel.course!.id),
                    // ));
                    // Get.to(Post(
                    //     courseid: myCourseModel.course!.id.toString()));
                  },
                  icon: const Icon(
                    Icons.assignment_add,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    controller.goToVideoCall();
                  },
                  icon: const Icon(
                    Icons.video_call_outlined,
                    size: 30,
                  )),
            ],
          ),
          // trailing: Container(
          //   margin: EdgeInsets.only(bottom: 8),
          //   child: Column(
          //     children: [
          //       Expanded(
          //           child: IconButton(
          //               onPressed: () {
          //                 // Navigator.of(context).push(MaterialPageRoute(
          //                 //   builder: (context) =>
          //                 //       Post(courseid: myCourseModel.course!.id),
          //                 // ));
          //                 Get.to(Post(
          //                     courseid: myCourseModel.course!.id.toString()));
          //               },
          //               icon: const Icon(
          //                 Icons.post_add,
          //                 size: 30,
          //               ))),
          //       SizedBox(
          //         height: 20,
          //       ),
          //       Expanded(
          //           child: IconButton(
          //               onPressed: () {},
          //               icon: const Icon(
          //                 Icons.assignment_add,
          //                 size: 30,
          //               )))
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}

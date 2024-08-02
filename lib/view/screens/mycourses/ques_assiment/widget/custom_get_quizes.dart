import 'package:e_learningplatform/controller/assiment_list_controller.dart';
import 'package:e_learningplatform/data/model/quizetion_model.dart';
import 'package:e_learningplatform/view/screens/mycourses/ques_assiment/quiz_scrren.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/quize2_controller.dart';

class CustomGetMyQuiz extends GetView<AssimentListController> {
  final QuizetionModel myQuiztionModel;
  const CustomGetMyQuiz({super.key, required this.myQuiztionModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: () {
            controller.goToQuizeScreen(myQuiztionModel.id.toString());
          },
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "${myQuiztionModel.title}",
                style: TextStyle(fontSize: 17, color: Colors.grey.shade800),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${myQuiztionModel.description}",
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
            trailing: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Score ${myQuiztionModel.score}",
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // trailing: Wrap(
            //   direction: Axis.horizontal,
            //   children: [
            //     IconButton(
            //         onPressed: () {
            //           Navigator.of(context).push(MaterialPageRoute(
            //             builder: (context) =>
            //                 Post(courseid: myQuiztionModel.course!.id.toString()),
            //           ));
            //           // Get.to(Post(
            //           //     courseid: myQuiztionModel.course!.id.toString()));
            //         },
            //         icon: const Icon(
            //           Icons.post_add,
            //           size: 30,
            //         )),
            //     IconButton(
            //         onPressed: () {
            //           // Navigator.of(context).push(MaterialPageRoute(
            //           //   builder: (context) =>
            //           //       Post(courseid: myQuiztionModel.course!.id),
            //           // ));
            //           // Get.to(Post(
            //           //     courseid: myQuiztionModel.course!.id.toString()));
            //         },
            //         icon: const Icon(
            //           Icons.assignment_add,
            //           size: 30,
            //         )),
            //   ],
            // ),
            // trailing: Container(
            //   margin: EdgeInsets.only(bottom: 8),
            //   child: Column(
            //     children: [
            //       Expanded(
            //           child: IconButton(
            //               onPressed: () {
            //                 // Navigator.of(context).push(MaterialPageRoute(
            //                 //   builder: (context) =>
            //                 //       Post(courseid: myQuiztionModel.course!.id),
            //                 // ));
            //                 Get.to(Post(
            //                     courseid: myQuiztionModel.course!.id.toString()));
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
      ),
    );
  }
}

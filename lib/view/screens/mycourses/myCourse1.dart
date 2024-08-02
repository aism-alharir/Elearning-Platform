import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../component/bottom_option.dart';
import '../../../controller/myCourses/my_course_controller.dart';
import '../../../controller/myCourses/mycourseanimation.dart';
import '../../../core/constant/color.dart';
import 'post/post.dart';

class MyCourse1List extends StatelessWidget {
  final controller = Get.put(MyCourseController());
  final controlleranimation = Get.put(ListViewController());

  @override
  Widget build(BuildContext context) {
    controlleranimation.width = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 34, 36, 49),
      body: SafeArea(
        child: GetBuilder<ListViewController>(
          builder: (controlleranimation) => ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              const Center(
                child: Text(
                  "My Courses",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimaryColor,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GetBuilder<MyCourseController>(
                builder: (controller) => ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    final myCourse = controller.data[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        duration: Duration(milliseconds: 600 + (index * 300)),
                        curve: Curves.slowMiddle,
                        transform: Matrix4.translationValues(
                          controlleranimation.myAnimation
                              ? 0
                              : controlleranimation.width,
                          0,
                          0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    controller.goToVideo(
                                        myCourse.course!.id.toString());
                                  },
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                        myCourse.course!.image.toString()),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      myCourse.course!.title.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                        myCourse.course!.instructor.toString()),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) => Post(
                                                  courseid: myCourse.course!.id
                                                      .toString()),
                                            ));
                                            // Get.to(Post(
                                            //     courseid: myCourseModel.course!.id.toString()));
                                          },
                                          icon: const Icon(
                                            Icons.post_add,
                                            size: 30,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              controller.goToAssimentList(
                                                  myCourse.course!.id
                                                      .toString());
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
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              controller.goToVideoCall();
                                            },
                                            icon: const Icon(
                                              Icons.video_call_outlined,
                                              size: 30,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
        bottomNavigationBar: const BottomOption(slecetedIndex: 2),
    );
  }
}

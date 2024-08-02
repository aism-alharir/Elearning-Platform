import '../../../../controller/my_Video_7_Controller.dart';
import '/core/class/handlingdataview.dart';
import '/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LessonList extends StatelessWidget {
  final LessonController controller = Get.put(LessonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: const Text('Lessons'),
        centerTitle: true,
      ),
      body: Wrap(
        children: [
          Container(
            height: 260,
            color: AppColor.kPrimaryColor,
            child: ListView(
              children: [
                Column(
                  children: [
                    GetBuilder<LessonController>(
                      builder: (controller) {
                        if (controller.selectedVideoPlayerController == null) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        return HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: Column(
                            children: [
                              Container(
                                height: 223,
                                child: VideoPlayer(
                                    controller.selectedVideoPlayerController!),
                              ),
                              IconButton(
                                onPressed: () => controller
                                        .selectedVideoPlayerController!
                                        .value
                                        .isPlaying
                                    ? controller.selectedVideoPlayerController!
                                        .pause()
                                    : controller.selectedVideoPlayerController!
                                        .play(),
                                icon: Icon(
                                  controller.selectedVideoPlayerController!
                                          .value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.grey,
                                  size: 34,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            child: Wrap(
              children: [
                GetBuilder<LessonController>(
                  builder: (controller) => ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.lessons.length,
                    itemBuilder: (context, index) {
                      final lesson = controller.lessons[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(lesson.title!),
                          leading: Image.network(
                            lesson.image!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                          onTap: () => controller.selectLesson(lesson: lesson),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer() {
    if (controller.selectedVideoPlayerController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return VideoPlayer(controller.selectedVideoPlayerController!);
  }
}

import '/core/class/statusrequest.dart';
import '/core/functions/handlingdatacontroller.dart';
import '/core/services/services.dart';
import '/data/datasource/remote/video_data.dart';
import '/data/model/video_model.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LessonController extends GetxController {
  String? corseid;
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  VideoData videoData = VideoData(Get.find());
  var lessons = <VideoModel>[];
  VideoPlayerController? _selectedVideoPlayerController;
  VideoPlayerController? get selectedVideoPlayerController =>
      _selectedVideoPlayerController;

  // Future<void> fetchLessons( ) async {
  //   final url = Uri.parse('your_django_api_url/$courseId');
  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body) as List;
  //     lessons.value = data.map((e) => VideoModel.fromJson(e)).toList();
  //   } else {
  //     print('Failed to fetch lessons');
  //   }
  // }

  getData() async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    var response = await videoData.getData(corseid!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responseData = response;
      lessons.addAll(responseData.map((e) => VideoModel.fromJson(e)));
      print("data");
      print(lessons);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  // void selectLesson({bool init = false, VideoModel? lesson}) async {
  //   if (_selectedVideoPlayerController != null) {
  //     _selectedVideoPlayerController!.dispose();
  //   }

    

  //   _selectedVideoPlayerController = VideoPlayerController.networkUrl(
  //       Uri.parse(lesson!.videoUrl!))
  //     ..addListener(() {
  //       update();
  //     })
  //     ..setLooping(true)
  //     ..initialize().then((value) => _selectedVideoPlayerController!.play());

  //   update();

  //   if (!init) {
  //     _selectedVideoPlayerController!.pause();
  //   }
  //   update();
  // }

  void selectLesson({bool init = false, VideoModel? lesson}) async {
  if (_selectedVideoPlayerController != null) {
    _selectedVideoPlayerController!.dispose();
  }

  if (lesson != null && lesson.videoUrl != null) {
    _selectedVideoPlayerController = VideoPlayerController.networkUrl(Uri.parse(lesson.videoUrl!))
      ..addListener(() {
        update();
      })
      ..setLooping(true)
      ..initialize().then((value) => _selectedVideoPlayerController!.play());
  }

  update();

  if (!init && _selectedVideoPlayerController != null) {
    _selectedVideoPlayerController!.pause();
  }
  update();
}

  @override
  void onInit() {
    corseid = Get.arguments['courseid'];
    getData();
    selectLesson(
      init: true,
    );
    super.onInit();
  }
}
import 'package:e_learningplatform/core/class/statusrequest.dart';
import 'package:e_learningplatform/core/functions/handlingdatacontroller.dart';
import 'package:e_learningplatform/linkapi.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/datasource/remote/myquiz_data.dart';
import '../data/model/quezition1.dart';

class QuizController extends GetxController {
  MyQuizData myQuizData = MyQuizData(Get.find());
  List<Question> questionList = [];
  int currentQuestionIndex = 0;
  int score = 0;
  AnswersList? selectedAnswer;
  String? quizeid;
  late StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    quizeid = Get.arguments['quizeid'];
    getData();
    super.onInit();
  }

  getData() async {
    //  questionList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await myQuizData.getData(quizeid!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responseData = response;
      questionList.clear();
      questionList.addAll(responseData.map((e) => Question.fromJson(e)));
      print("data");
      print(questionList);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  // Future<void> fetchQuizData() async {
  //   try {
  //     String url = "${AppLink.server}/quizzes/Question/?quiz=$quizeid";
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = json.decode(response.body);
  //       questionList.addAll(data.map((e) => Question.fromJson(e)));
  //       print(questionList);
  //     } else {
  //       throw Exception('Failed to fetch quiz data');
  //     }
  //   } catch (e) {
  //     print('Error fetching quiz data: $e');
  //   }
  // }

  void answerQuestion(AnswersList answer) {
    if (selectedAnswer == null) {
      if (answer.isCorrect!) {
        score++;
      }
      selectedAnswer = answer;
      update(); // Notify GetX that the state has changed
    }
  }

  void nextQuestion() {
    bool isLastQuestion = currentQuestionIndex == questionList.length - 1;
    if (isLastQuestion) {
      // Display score
      _showScoreDialog();
    } else {
      selectedAnswer = null;
      currentQuestionIndex++;
      update(); // Notify GetX that the state has changed
    }
  }

  void restartQuiz() {
    currentQuestionIndex = 0;
    score = 0;
    selectedAnswer = null;

    update(); // Notify GetX that the state has changed
  }

  void _showScoreDialog() {
    bool isPassed = score >= questionList.length * 0.6;
    String title = isPassed ? "Passed" : "Failed";

    Get.dialog(
      AlertDialog(
        title: Text(
          "$title | Score is $score",
          style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
        ),
        content: ElevatedButton(
          child: const Text("Go Assiment Page"),
          onPressed: () {
            Get.offNamed(RoutesNames.assimentlist);
            restartQuiz();
          },
        ),
      ),
    );
  }
}

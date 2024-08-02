import 'package:e_learningplatform/controller/quize2_controller.dart';
import 'package:e_learningplatform/core/class/handlingdataview.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/model/quezition1.dart';

class QuizView extends StatelessWidget {
  final QuizController controller = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      //  const Color.fromARGB(255, 5, 50, 80),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: GetBuilder<QuizController>(
          builder: (controller) {
            if (controller.questionList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Simple Quiz App",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    _questionWidget(controller),
                    _answerList(controller),
                    _nextButton(controller),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _questionWidget(QuizController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${controller.currentQuestionIndex + 1}/${controller.questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: const Color.fromARGB(166, 189, 255, 183),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            controller
                .questionList[controller.currentQuestionIndex].questionText!,
            style: const TextStyle(
              color: AppColor.grey2,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  Widget _answerList(QuizController controller) {
    return Column(
      children:
          controller.questionList[controller.currentQuestionIndex].answersList!
              .map(
                (e) => _answerButton(controller, e),
              )
              .toList(),
    );
  }

  Widget _answerButton(QuizController controller, AnswersList answer) {
    bool isSelected = answer == controller.selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected
              ? const Color.fromARGB(166, 189, 255, 183)
              : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          controller.answerQuestion(answer);
        },
        child: Text(
          answer.answerText!,
          style: TextStyle(
              fontSize: 15,
              color: Colors.grey[900],
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _nextButton(QuizController controller) {
    bool isLastQuestion =
        controller.currentQuestionIndex == controller.questionList.length - 1;

    return Container(
      width: MediaQuery.of(Get.context!).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: const Color.fromARGB(166, 136, 241, 127),
          onPrimary: Colors.black,
        ),
        onPressed: () {
          controller.nextQuestion();
        },
        child: Text(
          isLastQuestion ? "Submit" : "Next",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

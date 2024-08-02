// import 'package:e_learningplatform/controller/mvc_quiz_controller.dart';
// import 'package:e_learningplatform/core/constant/color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';



// class QuizScreen extends StatelessWidget {
//   final QuizController quizController = Get.put(QuizController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 5, 50, 80),
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             const Text(
//               'Simple Quiz App',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//             _questionWidget(),
//             _answerList(),
//             _nextButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _questionWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Obx(
//           () => Text(
//             'Question ${quizController.currentQuestionIndex + 1}/${quizController.questionList.length.toString()}',
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Obx(
//           () => Container(
//             alignment: Alignment.center,
//             width: double.infinity,
//             padding: const EdgeInsets.all(32),
//             decoration: BoxDecoration(
//               color: Colors.orangeAccent,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Text(
//               quizController.questionList[quizController.currentQuestionIndex]
//                   .questionText,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _answerList() {
//     return Obx(
//       () => Column(
//         children: quizController.questionList[quizController.currentQuestionIndex]
//             .answersList
//             .map(
//               (e) => _answerButton(e),
//             )
//             .toList(),
//       ),
//     );
//   }

//   Widget _answerButton(Answer answer) {
//     bool isSelected = answer == quizController.selectedAnswer;

//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       height: 48,
//       child: ElevatedButton(
//         child: Text(answer.answerText),
//         style: ElevatedButton.styleFrom(
//           shape: const StadiumBorder(),
//           primary: isSelected ? Colors.orangeAccent : Colors.white,
//           onPrimary: isSelected ? Colors.white : Colors.black,
//         ),
//         onPressed: () => quizController.selectAnswer(answer),
//       ),
//     );
//   }

//   Widget _nextButton() {
//     bool isLastQuestion = quizController.currentQuestionIndex == quizController.questionList.length - 1;

//     return Container(
//       width: 60 ,
//       height: 48,
//       child: ElevatedButton(
//         child: Text(isLastQuestion ? 'Submit' : 'Next'),
//         style: ElevatedButton.styleFrom(
//           shape: const StadiumBorder(),
//           primary: AppColor.kPrimaryColor,
//           onPrimary: Colors.white,
//         ),
//         onPressed: () => quizController.nextQuestion(),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../../controller/quize1_controller.dart';
// import '../../../../../data/model/quezition1.dart';



// class QuizScreen extends StatelessWidget {
//   final QuizController quizController = Get.put(QuizController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 5, 50, 80),
//       body: Obx(() {
//         if (quizController.questionList.isEmpty) {
//           return Center(child: CircularProgressIndicator());
//         } else {
//           return Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 const Text(
//                   'Simple Quiz App',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                 ),
//                 _questionWidget(),
//                 _answerList(),
//                 _nextButton(),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }

//   Widget _questionWidget() {
//     final Question currentQuestion = quizController.questionList[quizController.currentQuestionIndex];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'Question ${quizController.currentQuestionIndex + 1}/${quizController.questionList.length.toString()}',
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 20),
//         Container(
//           alignment: Alignment.center,
//           width: double.infinity,
//           padding: const EdgeInsets.all(32),
//           decoration: BoxDecoration(
//             color: Colors.orangeAccent,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Text(
//             currentQuestion.questionText!,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _answerList() {
//   //  ```dart
//     return Column(
//       children: quizController.questionList[quizController.currentQuestionIndex].answersList!
//           .map(
//             (answer) => _answerButton(answer),
//           )
//           .toList(),
//     );
//   }

//   Widget _answerButton(AnswersList answer) {
//     bool isSelected = answer == quizController.selectedAnswer;

//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       height: 48,
//       child: ElevatedButton(
//         child: Text(answer.answerText!),
//         style: ElevatedButton.styleFrom(
//           shape: const StadiumBorder(),
//           primary: isSelected ? Colors.orangeAccent : Colors.white,
//           onPrimary: isSelected ? Colors.white : Colors.black,
//         ),
//         onPressed: () {
//           quizController.selectAnswer(answer);
//         },
//       ),
//     );
//   }

//   Widget _nextButton() {
//     bool isLastQuestion = quizController.isLastQuestion;

//     return Container(
//       width: MediaQuery.of(Get.context!).size.width * 0.5,
//       height: 48,
//       child: ElevatedButton(
//         child: Text(isLastQuestion ? 'Submit' : 'Next'),
//         style: ElevatedButton.styleFrom(
//           shape: const StadiumBorder(),
//           primary: Colors.blue, // Change this to your desired color
//           onPrimary: Colors.white,
//         ),
//         onPressed: () {
//           quizController.nextQuestion();
//         },
//       ),
//     );
//   }
// }
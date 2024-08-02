
// import 'package:e_learningplatform/controller/quize_scrren_controller.dart';
// import 'package:e_learningplatform/data/model/queztion_assiment_List_Model.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AnswerList extends GetView<QuizeScrrenController> {
//   final QuestionListModel questionListModel;
//   const AnswerList({super.key,required this.questionListModel});

//   @override
//   Widget build(BuildContext context) {
//       return Column(
//       children: questionListModel.answers![controller.currentQuestionIndex]
//           .map(
//             (e) => _answerButton(e),
//           )
//           .toList(),
//     );
//   }

//   Widget _answerButton(Answer answer) {
//     bool isSelected = answer == selectedAnswer;

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
//         onPressed: () {
//           if (selectedAnswer == null) {
//             if (answer.isCorrect) {
//               score++;
//             }
//             setState(() {
//               selectedAnswer = answer;
//             });
//           }
//         },
//       ),
//     );
//   }
// }
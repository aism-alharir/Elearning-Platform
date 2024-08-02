// import 'package:e_learningplatform/controller/quize_scrren_controller.dart';
// import 'package:e_learningplatform/data/model/queztion_assiment_List_Model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class QuiestionAssiment extends GetView<QuizeScrrenController> {
//   final QuestionListModel questionListModel;
//   const QuiestionAssiment({super.key, required this.questionListModel});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Question ${controller.currentQuestionIndex + 1}/${controller.questionList.length.toString()}",
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
//             questionListModel.text![controller.currentQuestionIndex],
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

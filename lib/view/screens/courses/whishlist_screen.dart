// import 'package:e_learningplatform/component/bottom_option.dart';
// import 'package:e_learningplatform/view/screens/courses/widget/whishlist.dart';
// import 'package:flutter/material.dart';

// import '../../../component/shopping_cart_option.dart';

// class WhishListScreen extends StatelessWidget {
//   const WhishListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 5),
//               child: Text(
//                 "WishList",
//                 style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey.shade900),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const WhishList(),
//           ],
//         ),
//       )),
//       floatingActionButton: const ShoppingCartOption(),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: const BottomOption(slecetedIndex: 3),
//     );
//   }
// }

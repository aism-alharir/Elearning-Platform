import 'package:e_learningplatform/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          color: isActive
              ? AppColor.kPrimaryColor
              : const Color.fromARGB(255, 171, 206, 226),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(
            color: isActive ? Colors.white : AppColor.kPrimaryColor,
            height: 1,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

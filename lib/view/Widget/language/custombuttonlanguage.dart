import 'package:e_learningplatform/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonLanguage(
      {Key? key, required this.textButton, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      width: double.infinity,
      child: MaterialButton(
          onPressed: onPressed,
          textColor: Colors.white,
          color: AppColor.kPrimaryColor,
          child: Text(
            textButton,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }
}

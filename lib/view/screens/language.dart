import 'package:e_learningplatform/core/localization/changelocale.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:e_learningplatform/view/Widget/language/custombuttonlanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleControllere> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(
              height: 15,
            ),
            CustomButtonLanguage(
              textButton: "Ar",
              onPressed: () {
                controller.changelanguage("ar");
                Get.toNamed(RoutesNames.onBoarding);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButtonLanguage(
                textButton: "En",
                onPressed: () {
                  controller.changelanguage("en");
                  Get.toNamed(RoutesNames.onBoarding);
                })
          ],
        ),
      ),
    );
  }
}

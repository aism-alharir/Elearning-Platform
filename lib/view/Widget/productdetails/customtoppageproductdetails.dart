import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learningplatform/controller/productdetails_controller.dart';
import 'package:e_learningplatform/core/constant/color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../linkapi.dart';

class CustomTopPageProductDetails extends GetView<ProductDetailsControllerImp> {
  const CustomTopPageProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 180,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                ),
              ),
              Positioned(
                  top: 40,
                  left: Get.width / 8,
                  right: Get.width / 8,
                  child: Hero(
                    tag: "${controller.courseModel.id}",
                    child: Image.network(
                      "${controller.courseModel.image}",
                        height: 250,
                        fit: BoxFit.fill,
                        ),
                  ))
            ],
          );
  }
}
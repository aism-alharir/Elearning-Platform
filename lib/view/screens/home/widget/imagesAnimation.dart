import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Offer2 extends StatelessWidget {
  Offer2({super.key});

  List<String> images = [
    "assets/images/offer1.png",
    "assets/images/offer2.PNG",
    "assets/images/offer3.PNG",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 450,
          width: MediaQuery.of(context).size.width,
          child: FanCarouselImageSlider(
            imagesLink: images,
            isAssets: true,
            sliderHeight: 430,
            autoPlay: true,
            imageFitMode: BoxFit.fill,
            // indicatorActiveColor: Colors.indigo,
            // indicatorDeactiveColor: Colors.grey,
            showIndicator: true,
          ),
        )
      ],
    );
  }
}

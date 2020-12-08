import 'package:carousel_slider/carousel_slider.dart';
import 'package:ccrwork_mobile/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Kooter extends StatelessWidget {
  var imgList = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(children: [
          Container(
            width: double.infinity,

            color: AppColor.mainColor,
          ),
          CarouselSlider(
            options: CarouselOptions(autoPlay: true,autoPlayInterval: Duration(seconds: 5), viewportFraction: 1, height: 300),
            items: imgList
                .map((item) => Container(
              child: Center(
                child: Image.asset(
                    'assets/images/c_${item.toString()}.jpg',
                    width: 800,
                    height: 700,
                    fit:BoxFit.fill
                ),
              ),
            ))
                .toList(),
          )
        ]));
  }
}

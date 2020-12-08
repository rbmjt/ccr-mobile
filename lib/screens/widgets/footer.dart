import 'package:carousel_slider/carousel_slider.dart';
import 'package:ccrwork_mobile/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Footer extends StatelessWidget {
  var imgList = [1, 2, 3, 4, 5, 6, 7, 8];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 50,
            color: AppColor.mainColor,
            child: Center(child: Text('Clients We Work With')),
          ),
          CarouselSlider(
            options: CarouselOptions(autoPlay: true, height: 100),
            items: imgList
                .map((item) => Container(
                      child: Center(
                        child: Image.asset(
                          'assets/images/comp_${item.toString()}.jpg',
                          height: 100,
                        ),
                      ),
                    ))
                .toList(),
          )
        ]));
  }
}

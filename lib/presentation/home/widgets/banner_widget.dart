import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_tv/common/global_variables.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.bannerImages.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                i,
                fit: BoxFit.contain,
                height: 200,
              ),
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        height: 200,
      ),
    );
  }
}

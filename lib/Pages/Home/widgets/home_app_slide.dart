import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:go_green/Core/Constant/theme/app_colors.dart';
import 'package:go_green/Data/Models/service/img_resource.dart';

class HomeAppSlide extends StatelessWidget {
  const HomeAppSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          SizedBox(
            height: ScreenUtil().screenHeight * 0.25,
            width: ScreenUtil().screenWidth,
            child: ImageSlideshow(
              //A callback function that triggers whenever the slide changes.
              onPageChanged: (page) {
                (page);
              },
              indicatorColor: AppColors.primary,
              indicatorBackgroundColor: Colors.grey,
              indicatorRadius: 6.0,
              indicatorPadding: 10.0,
              autoPlayInterval: 90000,
              isLoop: true,
              children: List.generate(
                images.length,
                (i) {
                  //handles network image loading efficiently
                  // if the Img doesn't load, it will show the placeholder image
                  return Image.asset(images[i], fit: BoxFit.cover);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> images = [
  R.app_promotion_1,
  R.app_promotion_2,
  R.app_promotion_3,
];

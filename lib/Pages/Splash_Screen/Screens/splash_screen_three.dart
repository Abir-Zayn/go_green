import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_green/Core/Common/Widgets/app_style.dart';
import 'package:go_green/Core/Common/Widgets/app_textstyle.dart';
import 'package:go_green/Core/Constant/theme/app_colors.dart';
import 'package:go_green/Data/Models/service/img_resource.dart';

class SplashScreenThree extends StatelessWidget {
  const SplashScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40.h,
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 800.sp,
                height: 800.dm,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.splash_outerBg, // Orange light
                ),
              ),
              Container(
                width: 350.sp,
                height: 350.dm,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.splash_innerBg, // Orange light
                ),
              ),
              Container(
                width: 200.sp,
                height: 200.dm,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.splash_inner_color, // Orange light
                ),
              ),
              Container(
                width: 350.sp,
                height: 350.dm,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(R.splashPageThreeImg),
                    fit: BoxFit.contain,
                  ), // Orange light
                ),
              ),
              Positioned(
                bottom: 130.h,
                child: AppTextstyle(
                    text: 'Start and Connect',
                    style: appStyle(
                        size: 24.sp,
                        color: AppColors.primaryTextcolor,
                        fontWeight: FontWeight.w600)),
              ),
              Positioned(
                bottom: 70.h,
                child: AppTextstyle(
                  text:
                      'Enjoy! Share your travel stories and connect with\n travellers from all corners of the globe',
                  style: appStyle(
                      size: 16.sp,
                      color: AppColors.secondaryTextcolor,
                      fontWeight: FontWeight.w500),
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),

          // Page Indicator
        ],
      ),
    );
  }
}

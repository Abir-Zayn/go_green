import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_green/Core/Common/Widgets/app_style.dart';
import 'package:go_green/Core/Common/Widgets/app_textstyle.dart';
import 'package:go_green/Core/Constant/theme/app_colors.dart';
import 'package:go_green/Data/Models/service/img_resource.dart';

class SplashScreenOne extends StatelessWidget {
  const SplashScreenOne({super.key});

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
                height: 320.dm,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(R.splashPageOneImg),
                    fit: BoxFit.cover,
                  ), // Orange light
                ),
              ),
              Positioned(
                bottom: 100.h,
                child: AppTextstyle(
                    text: 'Welcome to Hapiway',
                    style: appStyle(
                        size: 24.sp,
                        color: AppColors.primaryTextcolor,
                        fontWeight: FontWeight.w600)),
              ),
              Positioned(
                bottom: 70.h,
                child: AppTextstyle(
                  text: 'Your one stop solution for all your health needs',
                  style: appStyle(
                      size: 16.sp,
                      color: AppColors.secondaryTextcolor,
                      fontWeight: FontWeight.w500),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_green/Core/Common/Widgets/app_style.dart';
import 'package:go_green/Core/Common/Widgets/app_textstyle.dart';
import 'package:go_router/go_router.dart';

class Blogpage extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final int likes;
  final int totalReacts;
  final bool isliked;
  final int blogId;

  const Blogpage(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.likes,
      required this.totalReacts,
      required this.isliked,
      required this.blogId});

  @override
  State<Blogpage> createState() => _BlogpageState();
}

class _BlogpageState extends State<Blogpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.go('/home');
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Expanded(
                child: Center(
                  child: AppTextstyle(
                    text: widget.title,
                    style: appStyle(
                        size: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          ClipRRect(
            borderRadius:
                BorderRadius.circular(12.r), // Use screen util for radius
            child: Image.network(
              widget.image,
              width: double.infinity,
              height: 250.h, // Use screen util for height
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.h),
          AppTextstyle(
            text: widget.title,
            style: appStyle(
                size: 20.sp, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10.h),
          Text(
            'Posted: 12-10.2020',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20.h),
          AppTextstyle(
            text: widget.description,
            style: appStyle(
                size: 14.sp, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: widget.isliked ? Colors.red : Colors.grey,
                  ),
                  SizedBox(width: 8.w),
                  AppTextstyle(
                    text: '${widget.likes} Likes',
                    style: appStyle(
                        size: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              AppTextstyle(
                text: '${widget.totalReacts} Reactions',
                style: appStyle(
                    size: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_green/Core/Common/Widgets/app_style.dart';
import 'package:go_green/Core/Common/Widgets/app_textstyle.dart';
import 'package:go_green/Data/Models/service/img_resource.dart';
import 'package:go_green/Pages/Home/widgets/blogPostsWidget.dart';
import 'package:go_green/Pages/Home/widgets/home_app_bar.dart';
import 'package:go_green/Pages/Home/widgets/home_app_slide.dart';
import 'package:go_green/Pages/Home/widgets/pick_places.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage(R.sunset_appbar), // Replace with your image asset
              fit: BoxFit.cover,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120), // Adjust height as needed
          child: HomeAppBar(), // Integrate HomeAppBar here
        ),
        elevation: 0, // Remove shadow if desired
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HomeAppSlide(), // Integrate HomeAppSlide here
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                child: AppTextstyle(
                  text: 'Offers for you',
                  style: appStyle(
                      size: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HomeAppSlide(),
              ),

              SizedBox(height: 10),

              SizedBox(
                height: 140, // Set a fixed height for PickPlaces
                child: PickPlaces(), // Integrate PickPlaces here
              ), // Integrate PickPlaces here

              //Show hot places

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextstyle(
                      text: "Hot Places 🔥",
                      style: appStyle(
                          size: 17.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 30.sp),
                    GestureDetector(
                      onTap: () {
                        // Handle "See All" tap
                      },
                      child: AppTextstyle(
                        text: "See All",
                        style: appStyle(
                            size: 17.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(width: 10)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Blogpostswidget(),
              ),

              //Create a card with a list of hot places
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_green/Core/Common/Widgets/app_search_bar.dart';
import 'package:go_green/Core/Common/Widgets/app_style.dart';
import 'package:go_green/Core/Common/Widgets/app_textstyle.dart';
import 'package:ionicons/ionicons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextstyle(
                    text: 'Welcome',
                    style: appStyle(
                        size: 20, // Reduced size
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  AppTextstyle(
                    text: 'Explore the world of green',
                    style: appStyle(
                        size: 15, // Reduced size
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(width: 10),
              //This Row holds the necessary icons
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        size: MediaQuery.of(context).size.width *
                            0.04, // Reduced size
                        Ionicons.chatbox_ellipses_outline,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        size: MediaQuery.of(context).size.width *
                            0.04, // Reduced size
                        Ionicons.notifications_outline,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          AppSearchBar(
            onChanged: (value) {
              print(value);
            },
          ),
        ],
      ),
    );
  }
}

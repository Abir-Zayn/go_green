import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_green/Core/Common/Widgets/app_textstyle.dart';
import 'package:go_green/Core/Constant/theme/app_colors.dart';
import 'package:go_green/Data/Models/home/pick_destination/destination_place_model.dart';
import 'package:go_green/Data/Models/home/pick_destination/destination_places.dart';

// ignore: must_be_immutable
class PickPlaces extends StatelessWidget {
  List<Place> places;
  final double imgSize;
  final double textSize;
  final Color textColor;
  final FontWeight fontWeight;

  PickPlaces({
    super.key,
    this.imgSize = 65,
    this.textSize = 15,
    this.textColor = AppColors.primaryTextcolor,
    this.fontWeight = FontWeight.w400,
    this.places = const [],
  }) {
    places = destinationPlaces.map((json) => Place.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle tap on the place
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Round Image Container
                  Container(
                    height: imgSize,
                    width: imgSize,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(imgSize / 2), // Make it round
                      color: Colors.grey[200], // Placeholder color
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          imgSize / 2), // Clip the image to be round
                      child: CachedNetworkImage(
                        imageUrl: places[index].destination_image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Spacing between image and text
                  // Place Name
                  AppTextstyle(
                    text: places[index].destination_name,
                    style: TextStyle(
                      color: textColor,
                      fontSize: textSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

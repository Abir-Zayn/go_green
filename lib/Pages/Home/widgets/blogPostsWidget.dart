import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_green/Core/Common/Widgets/app_style.dart';
import 'package:go_green/Core/Common/Widgets/app_textstyle.dart';
import 'package:go_green/Core/Constant/theme/app_colors.dart';
import 'package:go_green/Pages/Home/Bloc/Blogs/bloc_blog.dart';
import 'package:go_green/Pages/Home/Bloc/Blogs/blog_state.dart';

class Blogpostswidget extends StatefulWidget {
  const Blogpostswidget({super.key});

  @override
  State<Blogpostswidget> createState() => _BlogpostswidgetState();
}

class _BlogpostswidgetState extends State<Blogpostswidget> {
  Widget _buildImage(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(child: Text('No Image Available')),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: 150,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Container(
        height: 150,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: AppColors.accent3),
              const SizedBox(height: 8),
              Text(
                'Error: $error',
                style: const TextStyle(color: AppColors.accent3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocBlog, BlogState>(
      builder: (context, state) {
        if (state is BlogLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is BlogLoaded) {
          return SizedBox(
            height: 260, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.blogPosts.length,
              itemBuilder: (context, index) {
                final blogPostList = state.blogPosts[index];
                return Container(
                  width: 200, // Adjust the width as needed
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                  child: Card(
                    color: AppColors.primaryColor.withOpacity(0.6),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: _buildImage(blogPostList.imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextstyle(
                                text: blogPostList.title,
                                style: appStyle(
                                  size: 16,
                                  color: AppColors.primaryScaleColor1,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 8),
                            ],
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

        if (state is BlogError) {
          return Center(child: Text(state.message));
        }

        return const Center(child: Text('No Data Found'));
      },
    );
  }
}

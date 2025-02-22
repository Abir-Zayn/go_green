import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_green/Core/Constant/theme/app_theme.dart';
import 'package:go_green/Core/Constant/utils/Routes/app_routes.dart';
import 'package:go_green/Core/Constant/utils/environment.dart';
import 'package:go_green/Pages/Auth/Bloc/bloc_auth.dart';
import 'package:go_green/Pages/Home/Bloc/Blogs/Blog_Event.dart';
import 'package:go_green/Pages/Home/Bloc/Blogs/bloc_blog.dart';
import 'package:go_green/Pages/Home/Controllers/Repo/BlogRepo/blog_repository.dart';

void main() async {
  // Load the correct environment
  await dotenv.load(fileName: Environment.fileName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Some system settings mainly responsible for the top app bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set the color of the status bar
      statusBarIconBrightness: Brightness.dark, // For Android: use dark icons
      statusBarBrightness: Brightness.light, // For iOS: use light icons
    ));

    // Adaptive[Responsive] screen size implementation
    return FutureBuilder(
      future: BlogRepository.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final blogRepository = snapshot.data as BlogRepository;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => AuthBloc()),
              BlocProvider(
                create: (context) => BlocBlog(blogRepository: blogRepository)
                  ..add(FetchBlogPosts()),
              ),
            ],
            child: ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: false,
              useInheritedMediaQuery: true,
              builder: (_, Widget? child) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Go Green',
                  // Theme will be as the system
                  theme: AppTheme.lightTheme,
                  routerConfig: approuter,
                );
              },
            ),
          );
        }
      },
    );
  }
}

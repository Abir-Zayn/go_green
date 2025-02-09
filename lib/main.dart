import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_green/Core/Constant/theme/app_theme.dart';
import 'package:go_green/Core/Constant/utils/Routes/app_routes.dart';
import 'package:go_green/Data/Models/service/appwrite_service.dart';
import 'package:go_green/Pages/Auth/Bloc/bloc_auth.dart';
import 'package:go_green/Pages/Auth/Bloc/bloc_auth_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Some of system settings mainly responsible for the top app bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set the color of the status bar
      statusBarIconBrightness: Brightness.dark, // For Android: use dark icons
      statusBarBrightness: Brightness.light, // For iOS: use light icons
    ));

    //Adaptive[Responsive] screen size implementation
    Size screensize = MediaQuery.of(context).size;
    return RepositoryProvider(
      create: (context) => AppwriteService(),
      child: BlocProvider(
        create: (context) => BlocAuth(
          appwriteService: context.read<AppwriteService>(),
        )..add(CheckAuthStatus()),
        child: ScreenUtilInit(
          designSize: screensize,
          minTextAdapt: true,
          splitScreenMode: false,
          useInheritedMediaQuery: true,
          builder: (_, Widget? child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Go Green',
              // theme will be as the system
              theme: AppTheme.lightTheme,
              routerConfig: approuter,
            );
          },
        ),
      ),
    );
  }
}

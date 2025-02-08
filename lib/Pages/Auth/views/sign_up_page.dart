import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_green/Core/Common/Widgets/app_primary_btn.dart';
import 'package:go_green/Core/Common/Widgets/app_style.dart';
import 'package:go_green/Core/Common/Widgets/app_textfield.dart';
import 'package:go_green/Core/Common/Widgets/app_textstyle.dart';
import 'package:go_green/Core/Constant/theme/app_colors.dart';
import 'package:go_green/Data/Models/service/img_resource.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60.h,
              ),
              //Display the Logo
              Image.asset(
                R.appLogo,
                height: 200,
              ),
              //Display the Sign In Text
              AppTextstyle(
                text: "Create new Account",
                style: appStyle(
                    size: 20, color: Colors.black, fontWeight: FontWeight.w600),
              ),

              //Display the Sign in TextField
              Padding(
                padding: EdgeInsets.all(20),
                child: AppTextfield(
                  suffixIcon: Icon(
                    Ionicons.mail,
                    color: Colors.grey[350],
                  ),
                  controller: _emailController,
                  hintText: "Enter your Email",
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              //Display the Password TextField
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: AppTextfield(
                  suffixIcon: Icon(
                    Ionicons.lock_closed,
                    color: Colors.grey[350],
                  ),
                  controller: _passwordController,
                  hintText: "Create a New Password",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: AppTextfield(
                  suffixIcon: Icon(
                    Ionicons.lock_closed,
                    color: Colors.grey[350],
                  ),
                  controller: _confirmPasswordController,
                  hintText: "Re-Type your Password",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value != _passwordController.text) {
                      return 'Password does not match';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ),

              //Display the Forgot Password Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AppTextstyle(
                      text: "Forgot Password?",
                      style: appStyle(
                          size: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              //Login Button
              AppPrimaryBtn(
                  text: "Sign Up",
                  fontSize: 18.sp,
                  padding: 170.w,
                  elevation: 1.0,
                  onPressed: () {}),

              SizedBox(
                height: 20.h,
              ),

              //Display the OR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Ionicons.ellipsis_horizontal_outline,
                      color: Colors.grey[700], size: 25),
                  SizedBox(
                    width: 10.w,
                  ),
                  AppTextstyle(
                    text: "OR",
                    style: appStyle(
                        size: 14,
                        color: Colors.grey[600]!,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(Ionicons.ellipsis_horizontal_outline,
                      color: Colors.grey[500], size: 25),
                ],
              ),

              SizedBox(
                height: 20.h,
              ),
              //Display the Social Media Icons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Ionicons.logo_facebook,
                      color: Colors.blue,
                      size: 45,
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Icon(
                      Ionicons.logo_google,
                      color: Colors.red,
                      size: 45,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              //Display the Sign Up Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppTextstyle(
                    text: "Already have an account?",
                    style: appStyle(
                        size: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: AppTextstyle(
                      text: "Sign In",
                      style: appStyle(
                          size: 20,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_green/Core/Common/Widgets/app_primary_btn.dart';
import 'package:go_green/Core/Common/Widgets/app_style.dart';
import 'package:go_green/Core/Common/Widgets/app_textfield.dart';
import 'package:go_green/Core/Common/Widgets/app_textstyle.dart';
import 'package:go_green/Core/Constant/theme/app_colors.dart';
import 'package:go_green/Data/Models/service/img_resource.dart';
import 'package:go_green/Pages/Auth/Bloc/bloc_auth.dart';
import 'package:go_green/Pages/Auth/Bloc/bloc_auth_event.dart';
import 'package:go_green/Pages/Auth/Bloc/bloc_auth_states.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.formattedMessage),
              ),
            );
          } else if (state is AuthAuthenticated) {
            // Add a print statement for debugging
            print('Authentication successful, navigating to home');

            // Use GoRouter to navigate to home page
            context.go('/home');

            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Registration successful!'),
              ),
            );
          } else if (state is AuthRegisteredButLoginFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.message),
              ),
            );
            // Navigate to login page
            context.go('/login');
          }
        },
        child: SingleChildScrollView(
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
                      size: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),

                //Display the Sign in TextField
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: AppTextfield(
                    suffixIcon: Icon(
                      Ionicons.mail,
                      color: Colors.grey[350],
                    ),
                    controller: _emailController,
                    hintText: "Enter your email",
                    keyboardType: TextInputType.name,
                  ),
                ),
                //Display the Sign in TextField
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: AppTextfield(
                    suffixIcon: Icon(
                      Ionicons.mail,
                      color: Colors.grey[350],
                    ),
                    controller: _usernameController,
                    hintText: "Enter your name",
                    keyboardType: TextInputType.name,
                  ),
                ),

                //Display the Sign in TextField
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: AppTextfield(
                    suffixIcon: Icon(
                      Ionicons.person,
                      color: Colors.grey[350],
                    ),
                    controller: _firstNameController,
                    hintText: "First Name",
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: AppTextfield(
                    suffixIcon: Icon(
                      Ionicons.person,
                      color: Colors.grey[350],
                    ),
                    controller: _lastNameController,
                    hintText: "Last Name",
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
                    keyboardType: TextInputType.visiblePassword,
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: AppTextfield(
                    suffixIcon: Icon(
                      Ionicons.lock_closed,
                      color: Colors.grey[350],
                    ),
                    controller: _confirmPasswordController,
                    hintText: "Re-Type your Password",
                    keyboardType: TextInputType.visiblePassword,
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

                SizedBox(
                  height: 20.h,
                ),

                //Login Button
                AppPrimaryBtn(
                    text: "Sign Up",
                    fontSize: 18.sp,
                    padding: 170.w,
                    elevation: 1.0,
                    onPressed: () {
                      //Validate the input fields
                      // Validate input
                      if (_emailController.text.isEmpty ||
                          _passwordController.text.isEmpty ||
                          _usernameController.text.isEmpty ||
                          _firstNameController.text.isEmpty ||
                          _lastNameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all fields'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      // Validate email format
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(_emailController.text)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter a valid email'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      // Add password length validation
                      if (_passwordController.text.length < 8) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Password must be at least 8 characters long'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      context.read<AuthBloc>().add(
                            RegisterEvent(
                              email: _emailController.text.trim(),
                              username: _usernameController.text.trim(),
                              firstName: _firstNameController.text.trim(),
                              lastName: _lastNameController.text.trim(),
                              password: _passwordController.text.trim(),
                              repassword:
                                  _confirmPasswordController.text.trim(),
                            ),
                          );
                    }),

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
      ),
    );
  }
}

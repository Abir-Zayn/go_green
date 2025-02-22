import 'package:flutter/material.dart';
import 'package:go_green/Core/Constant/utils/shared_pref.dart';
import 'package:go_green/Data/Models/service/img_resource.dart';
import 'package:go_router/go_router.dart';

class DisplayLogo extends StatefulWidget {
  const DisplayLogo({super.key});

  @override
  State<DisplayLogo> createState() => _DisplayLogoState();
}

class _DisplayLogoState extends State<DisplayLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward().then((_) {
        _checkAuthAndNavigate();
      });
    //animation type has selected CurvedAnimation
    // and curve has set easeInOut to have smoother transition
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );
  }

  Future<void> _checkAuthAndNavigate() async {
    final prefManager = await SharedPrefManager.getInstance();

    if (prefManager.isTokenValid()) {
      context.go('/home');
    } else {
      await prefManager.clearSession();
      context.go('/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(
            R.appLogo,
            height: 350,
            width: 350,
          ),
        ),
      ),
    );
  }
}

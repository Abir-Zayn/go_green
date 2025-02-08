import 'package:flutter/material.dart';
import 'package:go_green/Data/Models/service/img_resource.dart';

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
      duration: const Duration(seconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(scale: _animation, child: Text(R.appLogo)),
      ),
    );
  }
}

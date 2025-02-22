import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AppSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const AppSearchBar({
    super.key,
    required this.onChanged,
    this.hintText = 'Search your escape',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(Ionicons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

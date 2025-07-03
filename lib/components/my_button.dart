import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color color;
  const MyButton({
    super.key, 
    required this.text,
    required this.onTap,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(
            text,
            style : TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade100,
              fontSize: 16,
            ),
            ),),
      ),
    );
  }
}
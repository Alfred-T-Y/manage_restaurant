import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color color;
  final double? width;
  final double? height;
  final double? padding;
  final double? margin;

  const MyButton({
    super.key, 
    required this.text,
    required this.onTap,
    required this.color,
    this.width,
    this.height,
    this.padding,
    this.margin
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
        padding: EdgeInsets.all(padding ?? 25),
        margin: EdgeInsets.symmetric(horizontal: margin ?? 25),
        width: width,
        height: height,
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
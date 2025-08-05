import 'package:flutter/material.dart';

class BackColor extends StatelessWidget {
  final Color colorStart;
  final Color colorEnd;
  final double width;
  final double heigh;
  final double raduis;

  const BackColor({super.key,
    required this.colorStart,
    required this.colorEnd,
    required this.width,
    required this.heigh,
    required this.raduis
    });

  @override
  Widget build(BuildContext context) {
    return Container(
          width: width,
          height: heigh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(raduis)),
            gradient: LinearGradient(
              colors: [
                colorStart,
                colorEnd,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
  }
}
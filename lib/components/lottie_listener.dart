import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiListener extends StatefulWidget {

  final ValueNotifier<String> listener;
  final double width;
  final double height;

  const LottiListener({super.key,
  required this.listener,
  required this.height,
  required this.width,
  });

  @override
  State<LottiListener> createState() => _LottiListenerState();
}

class _LottiListenerState extends State<LottiListener> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: widget.listener,
      builder: (context, animationPath, child) {
        return Lottie.asset(
          animationPath,
          width: 200,
          height: 200,
          fit: BoxFit.contain,
          );
        },
      );
  }

}
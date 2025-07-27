import 'package:flutter/material.dart';


class AdminHomePageOption extends StatelessWidget {
  final IconData icon;
  final Color colorstart;
  final Color colorend;
  final Function onPressed;

  const AdminHomePageOption({super.key,
    required this.icon,
    required this.colorstart,
    required this.colorend,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: IconButton(
              icon: Icon(icon,
                    size: 50,),
              onPressed: onPressed(),),
          ),
        ),
        CustomPaint(
          size: Size(200, 200),
          painter: RoundedRectanglePainter(
            colorstart, colorend),
        ),
      ],
    );
  }
}

class RoundedRectanglePainter extends CustomPainter {
  final Color colorstart;
  final Color colorend;

  RoundedRectanglePainter(
    this.colorstart,
    this.colorend,
  ); 
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final gradient = LinearGradient(
      colors: [
        colorstart,
        colorend,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(20),
    );

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

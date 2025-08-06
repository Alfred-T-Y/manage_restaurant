import 'package:flutter/material.dart';
import 'package:manage_restaurant/components/back_color.dart';


class AdminHomePageOption extends StatelessWidget {
  final IconData icon;
  final Color colorstart;
  final Color colorend;
  final Function() onPressed;
  final String title;
  final String text;

  const AdminHomePageOption({super.key,
    required this.icon,
    required this.colorstart,
    required this.colorend,
    required this.onPressed,
    required this.title,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    double width = 140;
    double heigh = 140;
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          BackColor(
            colorStart: colorstart, 
            colorEnd: colorend, 
            width: width, 
            heigh: heigh, 
            raduis: 20),
          SizedBox(
            width: width,
            height: heigh,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: Theme.of(context).colorScheme.onTertiary,),
                  SizedBox(height: 15,),
                  Text(
                    title,
                    style:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onTertiary
                    ),
                    ),
                  SizedBox(height: 5,),
                  Text(
                    text,
                    style:TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary
                    ),
                    ),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}



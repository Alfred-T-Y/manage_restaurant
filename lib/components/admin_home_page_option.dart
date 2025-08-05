import 'package:flutter/material.dart';
import 'package:manage_restaurant/components/back_color.dart';


class AdminHomePageOption extends StatelessWidget {
  final IconData icon;
  final Color colorstart;
  final Color colorend;
  final Function() onPressed;
  final String text;

  const AdminHomePageOption({super.key,
    required this.icon,
    required this.colorstart,
    required this.colorend,
    required this.onPressed,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          BackColor(
            colorStart: colorstart, 
            colorEnd: colorend, 
            width: 130, 
            heigh: 130, 
            raduis: 20),
          SizedBox(
            width: 130,
            height: 130,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      //SizedBox(width: 2,),
                      Icon(
                        icon,
                        size: 35,
                        color: Theme.of(context).colorScheme.onTertiary,)
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Text(
                        text,
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onTertiary
                        ),
                        ),
                    ],
                  )
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}



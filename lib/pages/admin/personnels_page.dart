import 'package:flutter/material.dart';
import 'package:manage_restaurant/components/my_button.dart';

class PersonnelsPage extends StatelessWidget {
  PersonnelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: personnels.length,
        itemBuilder: (context, index){
          return Expanded(
            child: PersonnelItem(
              name: personnels[index]['name'],
              role: personnels[index]['role'],
              ),
          );
        },

      )
    );

  }
  final List<Map<String, dynamic>>personnels =[
    {
      'name':'toto',
      'email':'toto@gmail.com',
      'role':'Deliver'  
    },
    {
      'name':'toto',
      'email':'toto@gmail.com',
      'role':'Kitchen_manager'  
    },
    {
      'name':'toto',
      'email':'toto@gmail.com',
      'role':'Manager'  
    },
    {
      'name':'al',
      'email':'toto@gmail.com',
      'role':'Manager'  
    },
    {
      'name':'el',
      'email':'toto@gmail.com',
      'role':'Manager'  
    }
  ];
}

class PersonnelItem extends StatelessWidget {
  final String name;
  final String role;

  const PersonnelItem({
    super.key,
    required this.name,
    required this.role});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch(role){
          case "Waiter":
            color = const Color.fromARGB(255, 15, 224, 123);
            break;
          case "Kitchen manager":
            color = const Color.fromARGB(255, 8, 202, 14);
            break;
          case "Deliver":
            color = const Color.fromARGB(255, 25, 1, 112);
            break;
          case "Manager":
            color = const Color.fromARGB(255, 146, 144, 23);
            break;
          default:
            color = const Color.fromARGB(255, 15, 224, 123);
        }
    return Stack(
      children:[ 
        Card(
          margin: EdgeInsets.all(8),
          elevation: 3,
          child: Row(
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 10),
              ),
              Spacer(),
              MyButton(
                text: 'Info', 
                onTap: (){}, 
                color: Colors.blue.shade900,
                padding: 0,
                margin: 2,
                width: 60,
                height: 30,),
              SizedBox(width: 5,),
              MyButton(
                text: 'Modifier', 
                onTap: (){}, 
                color: Colors.red.shade800,
                padding: 0,
                margin: 2,
                width: 60,
                height: 30,)
            ],
          ),
        ),
        CustomPaint(
          painter: RoundedRectanglePainter(color, color),
        )
      ]
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

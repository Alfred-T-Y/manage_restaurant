import 'package:flutter/material.dart';
import 'package:manage_restaurant/components/my_button.dart';

class PersonnelsPage extends StatefulWidget {
  const PersonnelsPage({super.key});

  @override
  State<PersonnelsPage> createState() => _PersonnelsPageState();
}

class _PersonnelsPageState extends State<PersonnelsPage> {
  List<Map<String, dynamic>>personnelsSort = [];

    @override
  void initState() {
    super.initState();
    personnelsSort = sortPersonnels(personnels);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personnels",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 20,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: personnelsSort.length,
          itemBuilder: (context, index){
            return PersonnelItem(
              name: personnelsSort[index]['name'],
              role: personnelsSort[index]['role'],
              );
          },
        
        ),
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
      'role':'Kitchen manager'  
    },
    {
      'name':'toto',
      'email':'toto@gmail.com',
      'role':'Manager'  
    },
    {
      'name':'al',
      'email':'toto@gmail.com',
      'role':'Waiter'  
    },
    {
      'name':'el',
      'email':'toto@gmail.com',
      'role':'Manager'  
    }
  ];
}

List<Map<String, dynamic>>sortPersonnels(List<Map<String, dynamic>>personnels){
  List<Map<String, dynamic>>personnelsManager=[];
  List<Map<String, dynamic>>personnelsKitchenManager=[];
  List<Map<String, dynamic>>personnelsDeliver=[];
  List<Map<String, dynamic>>personnelsWaiter=[];
  List<Map<String, dynamic>>personnelsDefault=[];
  List<Map<String, dynamic>>personnelsSort=[];

  for (var personnel in personnels){
        switch(personnel['role']){
          case "Waiter":
            personnelsWaiter.add(personnel);
            break;
          case "Kitchen manager":
            personnelsKitchenManager.add(personnel);
            break;
          case "Deliver":
            personnelsDeliver.add(personnel);
            break;
          case "Manager":
            personnelsManager.add(personnel);
            break;
          default:
            personnelsDefault.add(personnel);
        }
  }

  personnelsWaiter.sort((a, b) => a['name'].compareTo(b['name']));
  personnelsManager.sort((a, b) => a['name'].compareTo(b['name']));
  personnelsDeliver.sort((a, b) => a['name'].compareTo(b['name']));
  personnelsKitchenManager.sort((a, b) => a['name'].compareTo(b['name']));
  personnelsSort.sort((a, b) => a['name'].compareTo(b['name']));

  return personnelsSort = [
    ...personnelsManager,
    ...personnelsKitchenManager,
    ...personnelsWaiter,
    ...personnelsDeliver,
    ...personnelsDefault
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
            color = Colors.red.shade200;
            break;
          case "Kitchen manager":
            color = Colors.green.shade100;
            break;
          case "Deliver":
            color = Colors.blue.shade200;
            break;
          case "Manager":
            color = Colors.yellow.shade200;
            break;
          default:
            color = const Color.fromARGB(255, 15, 224, 123);
        }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children:[ 
              SizedBox(
                width: 700,
                height: 70,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10,),
                    Text(
                      name,
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    MyButton(
                      text: 'Info', 
                      onTap: (){}, 
                      color: Colors.blue.shade900,
                      padding: 0,
                      margin: 2,
                      width: 60,
                      height: 30,
                      textsize: 13,
                      raduis: 5,),
                    SizedBox(width: 5,),
                    MyButton(
                      text: 'Modifier', 
                      onTap: (){}, 
                      color: Colors.red.shade800,
                      padding: 0,
                      margin: 2,
                      width: 60,
                      height: 30,
                      textsize: 13,
                      raduis: 5,),
                    SizedBox(width: 5,),
                  ],
                ),
              ),
              IgnorePointer(
                child: CustomPaint(
                  size: Size(700, 70),
                  painter: RoundedRectanglePainter(color, color),
                ),
              )
            ]
          ),
        ],
      ),
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
      ..strokeWidth = 3;

    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(20),
    );

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

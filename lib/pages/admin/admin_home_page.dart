import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:manage_restaurant/components/admin_home_page_option.dart';
import 'package:manage_restaurant/pages/admin/my_drawer.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Let's have a meal!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 20,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdminHomePageOption(
                    icon: FontAwesomeIcons.user, 
                    colorstart: Colors.green.shade200, 
                    colorend: Colors.green.shade100,
                    text: 'Personnels', 
                    onPressed: (){
                      Navigator.pushNamed(context, '/PersonnelsPage');
                    },
                  ),
                  SizedBox(width: 25,),
                  AdminHomePageOption(
                    icon: FontAwesomeIcons.basketShopping, 
                    colorstart: Colors.red.shade200, 
                    colorend: Colors.red.shade100,
                    text: 'Stock', 
                    onPressed: (){})
                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdminHomePageOption(
                    icon: FontAwesomeIcons.utensils, 
                    colorstart: Colors.yellow.shade200, 
                    colorend: Colors.yellow.shade100,
                    text: 'Recipes', 
                    onPressed: (){}),
                  SizedBox(width: 25,),
                  AdminHomePageOption(
                    icon: FontAwesomeIcons.store, 
                    colorstart: Colors.blue.shade200, 
                    colorend: Colors.blue.shade100,
                    text: 'Stores', 
                    onPressed: (){})
                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdminHomePageOption(
                    icon: FontAwesomeIcons.chartBar, 
                    colorstart: const Color.fromARGB(255, 240, 238, 148), 
                    colorend: const Color.fromARGB(255, 243, 242, 171),
                    text: 'Statistics', 
                    onPressed: (){}),
                  SizedBox(width: 25,),
                  AdminHomePageOption(
                    icon: FontAwesomeIcons.boxArchive, 
                    colorstart: Colors.brown.shade200, 
                    colorend: Colors.brown.shade100,
                    text: 'Archives', 
                    onPressed: (){})
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}



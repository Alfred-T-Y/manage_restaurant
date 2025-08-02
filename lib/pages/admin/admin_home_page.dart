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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AdminHomePageOption(
                  icon: FontAwesomeIcons.user, 
                  colorstart: Colors.green, 
                  colorend: Colors.greenAccent, 
                  onPressed: (){
                    Navigator.pushNamed(context, '/PersonnelsPage');
                  },
                ),
                SizedBox(width: 25,),
                AdminHomePageOption(
                  icon: FontAwesomeIcons.basketShopping, 
                  colorstart: Colors.red, 
                  colorend: const Color.fromARGB(255, 250, 95, 95), 
                  onPressed: (){})
              ],
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AdminHomePageOption(
                  icon: FontAwesomeIcons.utensils, 
                  colorstart: Colors.yellow, 
                  colorend: const Color.fromARGB(255, 250, 250, 111), 
                  onPressed: (){}),
                SizedBox(width: 25,),
                AdminHomePageOption(
                  icon: FontAwesomeIcons.store, 
                  colorstart: Colors.blue, 
                  colorend: const Color.fromARGB(255, 129, 174, 250), 
                  onPressed: (){})
              ],
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AdminHomePageOption(
                  icon: FontAwesomeIcons.chartBar, 
                  colorstart: const Color.fromARGB(255, 146, 144, 23), 
                  colorend: const Color.fromARGB(255, 248, 246, 96), 
                  onPressed: (){}),
                SizedBox(width: 25,),
                AdminHomePageOption(
                  icon: FontAwesomeIcons.boxArchive, 
                  colorstart: Colors.brown, 
                  colorend: const Color.fromARGB(255, 136, 100, 87), 
                  onPressed: (){})
              ],
            ),
          ],
        ),
      )
    );
  }
}



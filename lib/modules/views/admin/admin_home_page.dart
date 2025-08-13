import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_restaurant/components/admin_home_page_option.dart';
import 'package:manage_restaurant/modules/views/admin/my_drawer_view.dart';
import 'package:manage_restaurant/routes/app_pages.dart';
import 'package:manage_restaurant/themes/theme_manager.dart';


class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    bool isDark = (ThemeManager().theme == ThemeMode.dark);

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
      drawer: MyDrawerView(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdminHomePageOption(
                    icon: CupertinoIcons.person, 
                    colorstart: isDark ? Colors.green.shade400 : Colors.green.shade200, 
                    colorend: isDark ? Colors.green.shade300 : Colors.green.shade100,
                    title: 'Personnels',
                    text: 'Manage your personnels', 
                    onPressed: (){
                      Get.toNamed(Routes.personnelsPage);
                    },
                  ),
                  SizedBox(width: 25,),
                  AdminHomePageOption(
                    icon: CupertinoIcons.shopping_cart, 
                    colorstart: isDark ? Colors.red.shade400 : Colors.red.shade200, 
                    colorend: isDark ? Colors.red.shade300 : Colors.red.shade100,
                    title: 'Stock',
                    text: 'Inventery of the stock', 
                    onPressed: (){})
                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdminHomePageOption(
                    icon: CupertinoIcons.square_list, 
                    colorstart: isDark ? Colors.yellow.shade400 : Colors.yellow.shade200, 
                    colorend: isDark ? Colors.yellow.shade300 : Colors.yellow.shade100,
                    title: 'Recipes',
                    text: 'Update your recipes', 
                    onPressed: (){}),
                  SizedBox(width: 25,),
                  AdminHomePageOption(
                    icon: Icons.store, 
                    colorstart: isDark ? Colors.blue.shade400 : Colors.blue.shade200, 
                    colorend: isDark ? Colors.blue.shade300 : Colors.blue.shade100,
                    title: 'Stores',
                    text: 'All your stores',
                    onPressed: (){})
                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdminHomePageOption(
                    icon: CupertinoIcons.chart_bar, 
                    colorstart: isDark ? const Color.fromARGB(255, 194, 192, 80) : const Color.fromARGB(255, 240, 238, 148), 
                    colorend: isDark ? const Color.fromARGB(255, 194, 192, 92) : const Color.fromARGB(255, 243, 242, 171),
                    title: 'Statistics',
                    text: 'Check your gains', 
                    onPressed: (){}),
                  SizedBox(width: 25,),
                  AdminHomePageOption(
                    icon: CupertinoIcons.archivebox, 
                    colorstart: isDark ? Colors.brown.shade400 : Colors.brown.shade200, 
                    colorend: isDark ? Colors.brown.shade300 : Colors.brown.shade100,
                    title: 'Archives',
                    text: 'History of your sells', 
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



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pablo/controllers/theme_controller.dart';
import 'package:pablo/views/widgets/category_chips.dart';
import 'package:pablo/views/widgets/custom_search_bar.dart';

class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SafeArea(child: Column(
                    children: [
                        /*START OF HEADER SECTION */
                        Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(children: [
                                    CircleAvatar(radius: 20, backgroundImage: AssetImage("assets/images/avatar.jpg"),),
                                    SizedBox(width: 12,),
                                    Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text("devJunkie", style: TextStyle(color: Colors.grey, fontSize: 14),),
                                            Text("Good morning", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),

                                        ],),
                                    Spacer(),
                                    IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
                                    IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),

                                    // theme button
                                    GetBuilder<ThemeController>(builder: (controller) => IconButton(onPressed: () => controller.toggleTheme(), icon: Icon(controller.isDarkMode ? Icons.light_mode : Icons.dark_mode))),

                                ],),),

                        // search bar
                        CustomSearchBar(),

                        // category chips
                      CategoryChips(),



                        /*END OF HEADER SECTION */

                    ],
                )),);
    }
}

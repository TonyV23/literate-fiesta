import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pablo/controllers/navigation_controller.dart';
import 'package:pablo/controllers/theme_controller.dart';
import 'package:pablo/views/account_screen.dart';
import 'package:pablo/views/home_screen.dart';
import 'package:pablo/views/shopping_screen.dart';
import 'package:pablo/views/widgets/custom_bottom_navbar.dart';
import 'package:pablo/views/wishlist_screen.dart';


class MainScreen extends StatelessWidget {
    const MainScreen({super.key});

    @override
    Widget build(BuildContext context) {

      final NavigationController navigationController = Get.find<NavigationController>();

        return GetBuilder<ThemeController>(
            builder: (themeController) => Scaffold( 
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: AnimatedSwitcher(
                    duration: Duration(milliseconds: 200), 
                    child: Obx(() => IndexedStack(
                            key: ValueKey(navigationController.currentIndex.value),
                            index: navigationController.currentIndex.value,
                            children: [
                                HomeScreen(),
                                ShoppingScreen(),
                                WishlistScreen(),
                                AccountScreen()
                            ],
                        )),),
              bottomNavigationBar: CustomBottomNavbar(),
            ));
    }
}

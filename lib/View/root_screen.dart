import 'package:flutter/material.dart';
import 'package:food_app/Provider/navigation_provider.dart';
import 'package:food_app/Provider/theme_provider.dart';
import 'package:food_app/View/Home/home_screen.dart';
import 'package:food_app/View/Profile/profile_screen.dart';
import 'package:food_app/View/call_screens/user_screen.dart';
import 'package:food_app/View/order_screens/orderdetail_screen.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ProfileScreen(),
    OrderdetailScreen(),
    UsersScreen()
  ];

  @override
  Widget build(BuildContext context) {
    
    final thememode = Provider.of<ThemeProvider>(context);
    final navigator = Provider.of<NavigationProvider>(context);
    return Scaffold(
    
      appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [IconButton(onPressed: (){
            
        thememode.toggleTheme();
      }, icon: thememode.isDarkMode ? const Icon(Icons.brightness_5_outlined) : const Icon(Icons.dark_mode)) ],),
      body: _screens[navigator.selectedIndex],

      /// Custom Bottom Nav
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:thememode.isDarkMode?  Color.fromRGBO(37, 37, 37, 1) : Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /// Home
            _buildNavItem(
              index: 0,
              icon: Icons.home,
              label: "Home",
            ),

            /// Profile
            _buildNavItem(
              index: 1,
              icon: Icons.person,
              label: "Profile",
            ),

            /// Cart with badge
            _buildNavItem(
              index: 2,
              icon: Icons.shopping_cart,
              label: "Cart",

            ),

            /// Messages with badge
            _buildNavItem(
              index: 3,
              icon: Icons.chat,
              label: "Chat",
              
            ),
          ],
        ),
      ),
    );
  }

  /// Nav Item Builder
  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    
  }) {
     final navigationProvider = Provider.of<NavigationProvider>(context);
    bool isSelected = navigationProvider.selectedIndex == index;

    return GestureDetector(
      onTap: () => navigationProvider.changeIndex(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  icon,
                  color: isSelected ? Colors.green : Colors.green.shade200,
                  size: 28,
                ),

                /// Badge
                
              ],
            ),

            /// Show label only if selected
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

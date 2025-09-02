import 'package:flutter/material.dart';
import 'package:food_app/View/Home/home_screen.dart';
import 'package:food_app/View/Profile/profile_screen.dart';
import 'package:food_app/View/call_screens/user_screen.dart';
import 'package:food_app/View/order_screens/orderdetail_screen.dart';

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
    return Scaffold(
      body: _screens[_selectedIndex],

      /// Custom Bottom Nav
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
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
              badgeCount: 7,
            ),

            /// Messages with badge
            _buildNavItem(
              index: 3,
              icon: Icons.chat,
              label: "Chat",
              badgeCount: 2,
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
    int badgeCount = 0,
  }) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
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
                if (badgeCount > 0)
                  Positioned(
                    right: -6,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                      child: Text(
                        badgeCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
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

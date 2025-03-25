import 'package:flutter/material.dart';
import 'package:yum_quick/Features/home/presentation/views/home_view.dart';
import 'package:yum_quick/Features/menu/presentation/views/menu_view.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // 🖥️ الشاشات الثلاثة التي سيتم التنقل بينها
  final List<Widget> _screens = [
    const HomeView(),
    const MenuView(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),

        // 🔹 Bottom Navigation Bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 0),
                _buildNavItem(Icons.restaurant_menu, 1),
                _buildNavItem(Icons.person, 2),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 🔹 زر في الـ Bottom Navigation Bar
  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Icon(
        icon,
        color: _selectedIndex == index ? Colors.white : Colors.white70,
        size: 30,
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("👤 Profile Screen", style: TextStyle(fontSize: 24)));
  }
}

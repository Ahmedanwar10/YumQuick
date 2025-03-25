import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yum_quick/core/constants/assets.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80), // مسافة من الأعلى لتناسب التصميم

        // ✅ **قسم الملف الشخصي**
       const  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(Assets.imagesOnboardingA),
              ),
              const SizedBox(width: 15),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John Smith",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    "Loremipsum@email.com",
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),

        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration:const  BoxDecoration(
              color:  ColorManager.white,
              borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                // 🏠 My Profile
                buildMenuItem(
                  icon: Icons.person_outline,
                  text: "My Profile",
                  onTap: () {
                    GoRouter.of(context).go('/updateProfile');
                  },
                ),

                // 🛍 My Orders
                buildMenuItem(
                  icon: Icons.shopping_bag_outlined,
                  text: "My Orders",
                  onTap: () {},
                ),

                // ❤️ My Favorites
                buildMenuItem(
                  icon: Icons.favorite_border,
                  text: "My Favorites",
                  onTap: () {
                    GoRouter.of(context).go('/fav');
                  },
                ),

                // ⚙️ Settings
                buildMenuItem(
                  icon: Icons.settings_outlined,
                  text: "Settings",
                  onTap: () {
                    GoRouter.of(context).go('/settings');
                  },
                ),

                // خط فاصل
                const Divider(thickness: 1, height: 30),

                // 🚪 Log Out
                buildMenuItem(
                  icon: Icons.logout,
                  text: "Log Out",
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// **🔹 دالة لإعادة استخدام عنصر القائمة**
  Widget buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color iconColor = Colors.orange,
    Color textColor = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 28),
      title: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      onTap: onTap,
    );
  }
}

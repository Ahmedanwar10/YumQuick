import 'package:flutter/material.dart';
import 'package:yum_quick/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // إذا كنت بحاجة إلى التهيئة قبل تشغيل التطبيق

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'YumQuick',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
    );
  }
}

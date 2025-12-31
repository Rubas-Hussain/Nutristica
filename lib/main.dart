import 'package:flutter/material.dart';
import 'package:nutritionist_app/auth/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:nutritionist_app/utils/responsive_util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutristica',
      builder: (_, child) {
        ResponsiveUtil.init(context);
        return child!;
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: Navigation(),
      // home: SplashScreen(),
      home: LoginScreen(),
    );
  }
}

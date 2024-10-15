import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_mge_rahmat_hidayat/services/prefs.dart';

import 'app/routes/app_pages.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PrefService prefService = PrefService();
  await prefService.prefInit();
  bool isLogin = prefService.isLogin;
  String initialRoutes = isLogin == false ? Routes.LOGIN : Routes.DASHBOARD;
  runApp(
    FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, s) {
        if (s.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            title: "Tes MGE Rahmat Hidayat",
            home: SplashScreen(),
          );
        } else {
          return GetMaterialApp(
            title: "Tes MGE Rahmat Hidayat",
            theme: AppTheme.light,
            initialRoute: initialRoutes,
            getPages: AppPages.routes,
          );
        }
      },
    ),
  );
  // runApp(
  //   GetMaterialApp(
  //     title: "Tes MGE Rahmat Hidayat",
  //     theme: AppTheme.light,
  //     initialRoute: initialRoutes,
  //     getPages: AppPages.routes,
  //   ),
  // );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Icon(
        Icons.terrain_sharp,
        size: 200,
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/dashboard/page.dart';
import '../../../../model/profile/get_data.dart';
import '../../../../services/prefs.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../../profil/views/profil_view.dart';

class DashboardController extends GetxController {
  final Rx<int> _currentIndex = 0.obs;

  int get getCurrentIndex => _currentIndex.value;

  void setCurrentIndex(int value) => _currentIndex.value = value;

  PrefService prefService = PrefService();

  UserProfile? profile;

  @override
  void onInit() async {
    setCurrentIndex(0);
    await prefService.prefInit();
    profile = UserProfile(
      userName: prefService.getUserName!,
      phone: prefService.getUserPhone,
      address: prefService.getUserAddress,
    );
    super.onInit();
  }

  final pages = <ModelPageDashboard>[
    ModelPageDashboard(
      title: '',
      icon: Icons.list,
      index: 0,
      page: const HomeView(),
    ),
    ModelPageDashboard(
      title: '',
      icon: Icons.person,
      index: 1,
      page: const ProfileView(),
    ),
  ];

  Future logOut() async {
    prefService.setIsLogin(false);
    Get.offAllNamed(Routes.LOGIN);
  }
}

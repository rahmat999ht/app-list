import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.secondary,
        title: Text(
          'Welcome, ${controller.profile?.userName ?? '-'}',
          style: context.textTheme.titleLarge!.copyWith(
            color: context.theme.colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.logOut,
            icon: const Icon(Icons.logout),
            color: context.theme.colorScheme.primary,
          ),
        ],
      ),
      body: Obx(() => controller.pages[controller.getCurrentIndex].page),
      bottomNavigationBar: Obx(
        () => bottomBar(context),
      ),
    );
  }

  BottomNavigationBar bottomBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: controller.getCurrentIndex,
      backgroundColor: context.theme.colorScheme.secondary,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (value) {
        controller.setCurrentIndex(value);
      },
      items: controller.pages.map(
        (e) {
          return BottomNavigationBarItem(
            label: e.title,
            icon: Icon(e.icon),
          );
        },
      ).toList(),
    );
  }
}

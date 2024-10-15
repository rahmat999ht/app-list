import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mge_rahmat_hidayat/app/routes/app_pages.dart';

import '../../../../services/prefs.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  PrefService prefService = PrefService();

  @override
  void onInit() async {
    await prefService.prefInit();
    await prefService.removeUserName();
    await prefService.removeUserPhone();
    await prefService.removeUserAddress();
    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  bool nullValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return true;
    }
    return false;
  }

  String? validatePassword(String? password) {
    if (nullValidation(password)) {
      return 'Password harap di isi';
    }

    // Cek apakah password valid (6 digit, angka, dan semua bilangan ganjil)
    if (password == null || password.length != 6) {
      return 'Password tidak sesuai';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(password)) {
      // Cek apakah password hanya berisi angka
      return 'Password tidak sesuai';
    }

    // Cek apakah setiap digit adalah bilangan ganjil
    for (int i = 0; i < password.length; i++) {
      int digit = int.parse(password[i]);
      if (digit % 2 == 0) {
        return 'Password tidak sesuai'; // Jika ada digit genap, return pesan
      }
    }

    // Jika semua syarat terpenuhi, password valid
    return null;
  }

  String? validateUserName(String? userName) {
    if (nullValidation(userName)) {
      return 'UserName harap di isi';
    }
    if (userName != 'mge') {
      return 'UserName tidak ditemukan';
    }
    return null;
  }

  Future login() async {
    try {
      if (formKey.currentState!.validate()) {
        await prefService.setIsLogin(true);
        await prefService.putUserName(userNameController.text);
        // Jika validasi berhasil, arahkan ke halaman home
        Get.offAllNamed(Routes.DASHBOARD);
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Error',
        content: Text('Error: $e'),
      );
    }
  }

  void formClear() {
    userNameController.clear();
    passwordController.clear();
  }
}

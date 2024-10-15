import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:test_mge_rahmat_hidayat/keys/assets_images.dart';

import '../../../../widgets/form_validate.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              KeysAssetsImages.login,
            ),
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 60,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FormValidate(
                  icon: Icons.person,
                  title: 'Username',
                  hint: 'username',
                  controller: controller.userNameController,
                  validator: (v) => controller.validateUserName(v),
                  keyboardType: TextInputType.name,
                ),
                const Gap(40),
                FormValidate(
                  icon: Icons.key,
                  title: 'Password',
                  hint: 'password',
                  controller: controller.passwordController,
                  validator: (v) => controller.validatePassword(v),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
                const Gap(40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: controller.login,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                      // backgroundColor: context.theme.colorScheme.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Submit', ),
                  ),
                ),
                const Gap(80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

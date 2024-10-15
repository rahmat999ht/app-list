import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../widgets/form_validate.dart';
import '../controllers/profil_controller.dart';
import 'image_wrap.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const WrapperImageUpdateProfil(image: null),
                const Gap(60),
                FormValidate(
                  icon: Icons.person,
                  title: 'Username',
                  hint: 'username',
                  controller: controller.userNameController,
                  validator: (v) => controller.validateUserName(v),
                  keyboardType: TextInputType.name,
                ),
                const Gap(20),
                FormValidate(
                  icon: Icons.phone,
                  title: 'Phone',
                  hint: '+62821-9469-2848',
                  controller: controller.phoneController,
                  validator: (v) => controller.validatePhone(v),
                  keyboardType: TextInputType.phone,
                  isPhone: true,
                ),
                const Gap(20),
                FormValidate(
                  icon: Icons.home_outlined,
                  title: 'Address',
                  hint: 'Makassar, Indonesia',
                  controller: controller.addressController,
                  validator: (v) => controller.validateAddress(v),
                  keyboardType: TextInputType.streetAddress,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../services/prefs.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class ProfileController extends GetxController {
  final controllerDash = Get.find<DashboardController>();
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  PrefService prefService = PrefService();

  @override
  void onInit() async {
    await prefService.prefInit();
    userNameController.text = controllerDash.profile?.userName ?? '-';
    if (controllerDash.profile!.phone != null) {
      phoneController.text = controllerDash.profile!.phone!;
    }
    if (controllerDash.profile!.address != null) {
      addressController.text = controllerDash.profile!.address!;
    }
    super.onInit();
  }

  @override
  void onClose() async {
    await prefService.putUserName(userNameController.text);
    await prefService.putUserPhone(phoneController.text);
    await prefService.putUserAddress(addressController.text);
    super.onClose();
  }

  bool nullValidation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return true;
    }
    return false;
  }

  String? validateUserName(String? userName) {
    if (nullValidation(userName)) {
      return 'UserName harap di isi';
    }
    return '';
  }

  String? validatePhone(String? phone) {
    if (nullValidation(phone)) {
      return 'Phone harap di isi';
    }
    return '';
  }

  String? validateAddress(String? address) {
    if (nullValidation(address)) {
      return 'Address harap di isi';
    }
    return '';
  }
}

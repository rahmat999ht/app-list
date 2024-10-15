import 'package:get/get.dart';
import 'package:test_mge_rahmat_hidayat/app/modules/profil/controllers/image_profile_controller.dart';

import '../../../../provider/list.dart';
import '../../home/controllers/home_controller.dart';
import '../../profil/controllers/profil_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListProvider>(
      () => ListProvider(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        listProvider: Get.find(),
      ),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<ImageUpdateController>(
      () => ImageUpdateController(),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}

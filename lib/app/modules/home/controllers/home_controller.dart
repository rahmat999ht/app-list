import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../model/list/list.dart';
import '../../../../provider/list.dart';

class HomeController extends GetxController with StateMixin<List<DataList>> {
  final ListProvider listProvider;

  HomeController({required this.listProvider});

  @override
  onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  Future downloadData() async {
    change(null, status: RxStatus.loading());
    listProvider.fetchList().then((response) {
      if (response.isOk) {
        final bookData = dataListFromJson(response.bodyString!);
        change(bookData, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }).onError((e, st) {
      Get.snackbar(
        'Error!',
        e.toString() + st.toString(),
        snackPosition: SnackPosition.TOP,
        borderColor: Colors.red,
      );
      change(null, status: RxStatus.error(e.toString() + st.toString()));
    });
  }

  Future onTapDetail(DataList data) {
    return Get.defaultDialog(
      title: data.title,
      titlePadding: const EdgeInsets.all(20),
      // Title padding kiri
      titleStyle: const TextStyle(color: Colors.black, fontSize: 16),
      middleText: '',
      content: Image.network(
        data.thumbnailUrl,
      ),
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ], // Pindahkan button ke actions
    );
  }

  Future onTapDelete(DataList data) {
    return Get.defaultDialog(
      title: 'Peringatan',
      middleText: '',
      content: Column(
        children: [
          const Text('Apakah anda ingin menghapus data ini??'),
          const Gap(12),
          Image.network(
            data.thumbnailUrl,
          ),
        ],
      ),
      onConfirm: () => deleteList(data.id),
      onCancel: Get.back,
      textConfirm: 'Ya',
      textCancel: 'Tidak',
    );
  }

  Future deleteList(int id) async {
    listProvider.deleteList(id).then((response) async {
      if (response.isOk) {
        Get.snackbar(
          'Info!',
          "Berhasil menghapus data",
          snackPosition: SnackPosition.TOP,
        );
        await downloadData();
        Get.back();
      } else {
        Get.snackbar(
          'Info!',
          "Gagal menghapus data",
          snackPosition: SnackPosition.TOP,
          borderColor: Colors.red,
        );
      }
    }).onError((e, st) {
      Get.snackbar(
        'Error!',
        e.toString() + st.toString(),
        snackPosition: SnackPosition.TOP,
        borderColor: Colors.red,
      );
    });
  }
}

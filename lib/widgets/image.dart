import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

mixin ImageState {
  Widget imageUpdateProfilEmpty(
      String? image, dynamic getImage, BuildContext context) {
    return InkWell(
      onTap: () async => await getImage(),
      //go to camera
      child: SizedBox(
        height: 100,
        width: 100,
        child: Card(
          color: context.theme.colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.person,
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget imageUpdateProfilSucces(
      List<XFile> state, dynamic getImage, BuildContext context) {
    return InkWell(
      onTap: () async => await getImage(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.file(
          File(state.first.path),
          fit: BoxFit.cover,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../model/list/list.dart';
import '../../../../state/state.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => ListView.builder(
          shrinkWrap: true,
          itemCount: state!.length,
          itemBuilder: (ctx, index) => cardData(
            context: context,
            data: state[index],
          ),
        ),
        onLoading: const LoadingState(),
        onError: (error) => ErrorState(error: error.toString()),
        onEmpty: const EmptyState(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.downloadData,
        backgroundColor: context.theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(
          Icons.download,
          color: context.theme.colorScheme.primary,
        ),
      ),
    );
  }

  Widget cardData({
    required BuildContext context,
    required DataList data,
  }) {
    return Container(
      // height: 80,
      width: Get.width,
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () => controller.onTapDetail(data),
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Image.network(
                data.thumbnailUrl,
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(data.title),
                  Text(
                    data.url,
                    style: context.textTheme.titleSmall!.copyWith(
                      color: context.theme.colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => controller.onTapDelete(data),
              icon: Icon(
                Icons.delete,
                color: context.theme.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

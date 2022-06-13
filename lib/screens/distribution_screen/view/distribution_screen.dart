// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:anilib/screens/distribution_screen/controller/distribution_screen_controller.dart';

class DistributionScreen extends GetView<DistributionScreenController> {
  const DistributionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: controller.screen,
          bottomNavigationBar: BottomNavigationBar(
            elevation: 8,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTabIndex,
            items: const [
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.newspaper_outlined),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Icon(Icons.calendar_month_outlined),
              ),
            ],
          ),
        ));
  }
}

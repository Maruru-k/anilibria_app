// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:anilib/screens/distribution_screen/controller/distribution_screen_controller.dart';
import 'package:anilib/screens/home/controller/home_controller.dart';
import 'package:anilib/screens/schedule/controller/schedule_controller.dart';

class DefaultBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DistributionScreenController());
    Get.put(HomeScreenController());
    Get.put(ScheduleScreenController());
  }
}

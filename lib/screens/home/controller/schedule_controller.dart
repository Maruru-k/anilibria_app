import 'package:anilib/models/schedule_title.dart';
import 'package:anilib/models/title.dart';
import 'package:anilib/repositories/schedule_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleScreenController extends GetxController {
  final ScheduleTitleRepository _scheduleTitleRepository;
  ScrollController _scrollController;
  List<ScheduleTitle> _scheduleTitle = [];
  RxBool isLoading = true.obs;
  RxBool isSliverAppBarExpanded = false.obs;

  List<ScheduleTitle> get scheduleTitle => _scheduleTitle;

  ScrollController get scrollController => _scrollController;

  ScheduleScreenController()
      : _scheduleTitleRepository = Get.put(ScheduleTitleRepository()),
        _scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getScheduleTitle();
  }

  void getScheduleTitle() async {
    isLoading.value = true;
    final response = await _scheduleTitleRepository.fetch();
    _scheduleTitle = response;
    isLoading.value = false;
  }

  // void onScroll(ScrollMetrics metrics) async {
  //   if (_scrollController.offset > (450)) {
  //     isSliverAppBarExpanded.value = true;
  //   } else {
  //     isSliverAppBarExpanded.value = false;
  //   }
  // }
}

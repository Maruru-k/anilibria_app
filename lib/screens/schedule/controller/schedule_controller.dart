// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:anilib/models/schedule_title.dart';
import 'package:anilib/repositories/schedule_title.dart';

class ScheduleScreenController extends GetxController {
  final ScheduleTitleRepository _scheduleTitleRepository;
  final ScrollController _scrollController;
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
}

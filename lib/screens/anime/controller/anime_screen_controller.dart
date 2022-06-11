import 'package:anilib/models/title.dart';
import 'package:anilib/repositories/random_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeScreenController extends GetxController {
  final RandomTitleRepository _randomTitleRepository;
  ScrollController _scrollController;
  late AniTitle _randomTitle;
  RxBool isLoading = true.obs;
  RxBool isSliverAppBarExpanded = false.obs;

  AniTitle get randomTitle => _randomTitle;

  ScrollController get scrollController => _scrollController;

  AnimeScreenController()
      : _randomTitleRepository = Get.put(RandomTitleRepository()),
        _scrollController = ScrollController();

  @override
  void onInit() {
    getRandomTitle();
    _scrollController.addListener(() {});
    super.onInit();
    update();
  }

  void getRandomTitle() async {
    isLoading.value = true;
    final response = await _randomTitleRepository.fetch();
    _randomTitle = response;
    isLoading.value = false;
  }

  void onScroll(BuildContext context, ScrollMetrics metrics) async {
    if (_scrollController.offset >
        (MediaQuery.of(context).size.height * 0.63)) {
      isSliverAppBarExpanded.value = true;
    } else {
      isSliverAppBarExpanded.value = false;
    }
  }
}

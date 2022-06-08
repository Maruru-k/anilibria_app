import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeScreenController extends GetxController {
  ScrollController _scrollController;
  RxBool isSliverAppBarExpanded = false.obs;

  ScrollController get scrollController => _scrollController;

  AnimeScreenController() : _scrollController = ScrollController();

  @override
  void onInit() {
    _scrollController.addListener(() {});
    super.onInit();
    update();
  }

  void onScroll(ScrollMetrics metrics) async {
    if (_scrollController.offset > (450)) {
      isSliverAppBarExpanded.value = true;
    } else {
      isSliverAppBarExpanded.value = false;
    }
  }
}

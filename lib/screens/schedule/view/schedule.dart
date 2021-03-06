// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:anilib/screens/detailed_anime/view/anime_screen.dart';
import 'package:anilib/screens/schedule/controller/schedule_controller.dart';
import 'package:anilib/theme/ani_colors.dart';
import 'package:anilib/theme/ani_text_style.dart';
import 'package:anilib/widgets/title_card.dart';

class ScheduleScreen extends GetView<ScheduleScreenController> {
  const ScheduleScreen({Key? key}) : super(key: key);

  Widget _dayCard({required int day}) {
    String dayName = "";

    switch (day) {
      case 0:
        dayName = "Понедельник";
        break;
      case 1:
        dayName = "Вторник";
        break;
      case 2:
        dayName = "Среда";
        break;
      case 3:
        dayName = "Четверг";
        break;
      case 4:
        dayName = "Пятница";
        break;
      case 5:
        dayName = "Суббота";
        break;
      case 6:
        dayName = "Воскресенье";
        break;
    }

    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dayName,
            style: AniTextStyle.mediumBold(AniColor.black),
          ),
          const SizedBox(height: 12),
          Flexible(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.scheduleTitle[day].title.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Get.to(() => AnimeScreen(
                    title: controller.scheduleTitle[day].title[index])),
                child: TitleCard(
                  title: controller.scheduleTitle[day].title[index],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AniColor.background,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              itemCount: 7,
              itemBuilder: (context, index) => _dayCard(day: index),
              separatorBuilder: (context, index) => const SizedBox(height: 30),
              // children: List.generate(6, (index) => _dayCard(day: index)),
            );
          }
        }),
      ),
    );
  }
}

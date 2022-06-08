import 'package:anilib/screens/anime/controller/anime_screen_controller.dart';
import 'package:anilib/screens/anime/random_anime_screen.dart';
import 'package:anilib/screens/anime/controller/random_anime_screen_controller.dart';
import 'package:anilib/screens/home/controller/home_controller.dart';
import 'package:anilib/screens/home/controller/schedule_controller.dart';
import 'package:anilib/screens/home/schedule.dart';
import 'package:anilib/theme/ani_colors.dart';
import 'package:anilib/theme/ani_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  HomeScreen({Key? key}) : super(key: key) {
    Get.put(RandomAnimeScreenController());
    Get.put(AnimeScreenController());
    Get.put(ScheduleScreenController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anilibria"),
        leading: const Icon(Icons.menu, size: 36),
        titleTextStyle: AniTextStyle.aniTitle(AniColor.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: ScheduleScreen()),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.to(() => RandomAnimeScreen()),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AniColor.white),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Случайный релиз",
                    textAlign: TextAlign.center,
                    style: AniTextStyle.medium(AniColor.primary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

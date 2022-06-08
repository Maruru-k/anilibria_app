import 'package:anilib/canstants.dart';
import 'package:anilib/screens/anime/controller/random_anime_screen_controller.dart';
import 'package:anilib/theme/ani_colors.dart';
import 'package:anilib/theme/ani_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RandomAnimeScreen extends GetView<RandomAnimeScreenController> {

  RandomAnimeScreen({Key? key}) : super(key: key) {
    controller.getRandomTitle();
  }

  List<Widget> _description() {
    return [
      const SizedBox(height: 10),
      Text(
        "Год: ${controller.randomTitle.season.year}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      Text(
        "Голоса: ${controller.randomTitle.team.voice.join(", ")}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      Text(
        "Тип: ${controller.randomTitle.type.fullString}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      Text(
        "Состояние релиза: ${controller.randomTitle.status.string}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      Text(
        "Жанры: ${controller.randomTitle.genres.join(", ")}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      const Divider(
        thickness: 1,
        color: AniColor.grey,
        height: 20,
      ),
      Text(
        controller.randomTitle.description,
        style: AniTextStyle.medium(AniColor.black),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AniColor.background,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return NotificationListener<ScrollUpdateNotification>(
            onNotification: (event) {
              controller.onScroll(event.metrics);
              return true;
            },
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  expandedHeight: 500,
                  backgroundColor: controller.isSliverAppBarExpanded.value
                      ? AniColor.background
                      : Colors.transparent,
                  iconTheme: IconThemeData(
                      color: controller.isSliverAppBarExpanded.value
                          ? AniColor.grey
                          : AniColor.white),
                  title: controller.isSliverAppBarExpanded.value
                      ? Text(
                    controller.randomTitle.name.ru,
                    style: AniTextStyle.title(AniColor.black),
                  )
                      : null,
                  flexibleSpace: controller.isSliverAppBarExpanded.value
                      ? null
                      : FlexibleSpaceBar(
                    background: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(basePosterUrl +
                          controller.randomTitle.poster.original),
                    ),
                  ),
                ),
                SliverPadding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Text(
                          controller.randomTitle.name.ru,
                          style: AniTextStyle.title2(AniColor.black),
                        ),
                        Text(
                          controller.randomTitle.name.en,
                          style: AniTextStyle.medium(AniColor.grey2),
                        ),
                        ..._description(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}

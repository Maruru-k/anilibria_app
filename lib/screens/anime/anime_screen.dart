import 'package:anilib/canstants.dart';
import 'package:anilib/models/title.dart';
import 'package:anilib/screens/anime/controller/anime_screen_controller.dart';
import 'package:anilib/theme/ani_colors.dart';
import 'package:anilib/theme/ani_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeScreen extends GetView<AnimeScreenController> {
  final AniTitle title;

  const AnimeScreen({Key? key, required this.title}) : super(key: key);

  List<Widget> _description() {
    return [
      const SizedBox(height: 10),
      Text(
        "Год: ${title.season.year}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      Text(
        "Голоса: ${title.team.voice.join(", ")}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      Text(
        "Тип: ${title.type.fullString}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      Text(
        "Состояние релиза: ${title.status.string}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      Text(
        "Жанры: ${title.genres.join(", ")}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      const Divider(
        thickness: 1,
        color: AniColor.grey,
        height: 20,
      ),
      Text(
        title.description,
        style: AniTextStyle.medium(AniColor.black),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AniColor.background,
      body: Obx(() {
        if (false) {
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
                          title.name.ru,
                          style: AniTextStyle.title(AniColor.black),
                        )
                      : null,
                  flexibleSpace: controller.isSliverAppBarExpanded.value
                      ? null
                      : FlexibleSpaceBar(
                          background: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                basePosterUrl + title.poster.original),
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
                          title.name.ru,
                          style: AniTextStyle.title2(AniColor.black),
                        ),
                        Text(
                          title.name.en,
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

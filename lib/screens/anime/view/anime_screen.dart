import 'package:anilib/canstants.dart';
import 'package:anilib/models/title.dart';
import 'package:anilib/screens/anime/controller/anime_screen_controller.dart';
import 'package:anilib/theme/ani_colors.dart';
import 'package:anilib/theme/ani_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeScreen extends GetView<AnimeScreenController> {
  late final AniTitle _title;

  AnimeScreen({Key? key, AniTitle? title}) : super(key: key) {
    if (title == null) controller.getRandomTitle();
    _title = title ?? controller.randomTitle;
  }

  List<Widget> _description() {
    return [
      const SizedBox(height: 10),
      Text(
        "Год: ${_title.season.year}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      Text(
        "Голоса: ${_title.team.voice.join(", ")}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      Text(
        "Тип: ${_title.type.fullString}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      Text(
        "Состояние релиза: ${_title.status.string}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      Text(
        "Жанры: ${_title.genres.join(", ")}",
        style: AniTextStyle.standard(AniColor.black),
      ),
      const Divider(
        thickness: 1,
        color: AniColor.grey,
        height: 20,
      ),
      Text(
        _title.description,
        style: AniTextStyle.medium(AniColor.black),
      ),
    ];
  }

  Widget _rating() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AniColor.grey2)),
      child: Row(
        children: [
          Text(
            _title.inFavorites.toString(),
            style: AniTextStyle.standard(AniColor.grey2),
          ),
          const Icon(
            Icons.star_outline,
            color: AniColor.grey2,
          ),
        ],
      ),
    );
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
              controller.onScroll(context, event.metrics);
              return true;
            },
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  expandedHeight: MediaQuery.of(context).size.height * 0.7,
                  backgroundColor: controller.isSliverAppBarExpanded.value
                      ? AniColor.background
                      : Colors.transparent,
                  iconTheme: IconThemeData(
                      color: controller.isSliverAppBarExpanded.value
                          ? AniColor.grey
                          : AniColor.white),
                  title: controller.isSliverAppBarExpanded.value
                      ? Text(
                          _title.name.ru,
                          style: AniTextStyle.title(AniColor.black),
                        )
                      : null,
                  flexibleSpace: controller.isSliverAppBarExpanded.value
                      ? null
                      : FlexibleSpaceBar(
                          background: Image(
                            // width: 350,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                basePosterUrl + _title.poster.original),
                          ),
                        ),
                ),
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _title.name.ru,
                                    style: AniTextStyle.title2(AniColor.black),
                                  ),
                                  Text(
                                    _title.name.en,
                                    style: AniTextStyle.standard(AniColor.grey2),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            _rating(),
                          ],
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

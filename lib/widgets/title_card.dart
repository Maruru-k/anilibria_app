// Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:anilib/canstants.dart';
import 'package:anilib/models/submodel/title.dart';

class TitleCard extends StatelessWidget {
  final AniTitle title;

  const TitleCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        fit: BoxFit.fitHeight,
        imageUrl: (basePosterUrl + title.poster.small),
      ),
      // NetworkImage(basePosterUrl + title.poster.small),
    );
  }
}

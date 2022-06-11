import 'package:anilib/canstants.dart';
import 'package:anilib/models/title.dart';
import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final AniTitle title;

  const TitleCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image(
        fit: BoxFit.fitHeight,
        image: NetworkImage(basePosterUrl + title.poster.small),
      ),
    );
  }
}

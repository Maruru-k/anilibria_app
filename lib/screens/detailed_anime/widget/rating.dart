import 'package:anilib/models/submodel/title.dart';
import 'package:anilib/theme/ani_colors.dart';
import 'package:anilib/theme/ani_text_style.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final AniTitle _title;

  const Rating({Key? key, required AniTitle title})
      : _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

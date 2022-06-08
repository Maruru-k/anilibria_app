import 'package:anilib/screens/home/home_screen.dart';
import 'package:anilib/theme/ani_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shikimori',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AniColor.primary,
          secondary: AniColor.black,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

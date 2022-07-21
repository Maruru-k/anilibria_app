// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:anilib/bindings.dart';
import 'package:anilib/widgets/my_scroll_behavior.dart';
import 'package:anilib/screens/distribution_screen/view/distribution_screen.dart';
import 'package:anilib/theme/ani_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
      child: GetMaterialApp(
        title: 'Anilibria',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AniColor.primary,
            secondary: AniColor.black,
          ),
        ),
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        getPages: [
          GetPage(
            name: "/distribution",
            page: () => const DistributionScreen(),
          ),
        ],
        initialRoute: "/distribution",
        initialBinding: DefaultBindings(),
      ),
    );
  }
}

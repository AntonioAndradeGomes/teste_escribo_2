import 'package:cobras_escadas/app/routes/app_pages.dart';
import 'package:cobras_escadas/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/home/home_binding.dart';
import 'modules/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cobras e Escadas',
      theme: appThemeData,
      home: const HomePage(),
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}

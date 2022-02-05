import 'package:cobras_escadas/app/modules/home/home_binding.dart';
import 'package:cobras_escadas/app/modules/home/home_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}

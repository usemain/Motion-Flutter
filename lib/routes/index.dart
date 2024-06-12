import 'package:motion/screens/theme/index.dart';
import 'package:get/get.dart';

import '../screens/details/index.dart';
import '../screens/dashboard/index.dart';

class Routes {
  static List<GetPage> getPages = [
    GetPage(
      name: '/',
      page: () => const TabBarPage(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: '/Details',
      page: () => const DetailsPage(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: '/Theme',
      page: () => const ThemePage(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
  ];
}

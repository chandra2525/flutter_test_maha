import 'package:get/get.dart';

import '../../src/features/users/list/component/user_list_binding.dart';
import '../../src/features/users/list/user_list_page.dart';
import 'route_name.dart';

class AppRoute {
  static final pages = [
    GetPage(
      name: RouteName.listUsers,
      page: () => const UserListPage(),
      binding: UserListBinding(),
    ),
  ];
}

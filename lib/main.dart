import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test_app_maha/app/routes/route_name.dart';
import 'app/app_binding.dart';
import 'package:test_app_maha/app/routes/app_route.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Entrance Test",
      initialRoute: RouteName.listUsers,
      getPages: AppRoute.pages,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}

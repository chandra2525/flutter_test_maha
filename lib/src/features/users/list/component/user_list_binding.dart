import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../repositories/user_repository.dart';
import 'user_list_controller.dart';

class UserListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(
      client: Get.find<Dio>(),
    ));

    Get.put(UserListController(
      userRepository: Get.find<UserRepository>(),
    ));
  }
}

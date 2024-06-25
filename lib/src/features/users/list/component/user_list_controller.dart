import 'package:get/get.dart';
import '../../../../models/user_model.dart';
import '../../../../repositories/user_repository.dart';
import '../../../../utils/networking_util.dart';
import '../../../../widgets/snackbar_widget.dart';

class UserListController extends GetxController {
  final UserRepository _userRepository;

  UserListController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final users = Rx<List<UserModel>>([]);

  final _isLoadingRetrieveUser = false.obs;

  bool get isLoadingRetrieveUser => _isLoadingRetrieveUser.value;

  final idTxt = ''.obs;
  final emailTxt = ''.obs;
  final firstNameTxt = ''.obs;
  final lastNameTxt = ''.obs;
  final avatarTxt = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  void getUsers() async {
    _isLoadingRetrieveUser.value = true;

    try {
      final productList = await _userRepository.getUserList();

      users.value = productList.data;
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    }
    _isLoadingRetrieveUser.value = false;
  }

  void sendUsers() async {
    _isLoadingRetrieveUser.value = true;
    try {
      await _userRepository.sendUser(idTxt.value, emailTxt.value,
          firstNameTxt.value, lastNameTxt.value, avatarTxt.value);
    } catch (error) {
      SnackbarWidget.showFailedSnackbar(NetworkingUtil.errorMessage(error));
    }
    _isLoadingRetrieveUser.value = false;
  }
}

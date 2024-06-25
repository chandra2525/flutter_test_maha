import 'package:dio/dio.dart';
import '../constants/endpoint.dart';
import '../models/response/user_list_response_model.dart';
import '../widgets/snackbar_widget.dart';

class UserRepository {
  final Dio _client;

  UserRepository({required Dio client}) : _client = client;

  Future<UserListResponseModel> getUserList() async {
    try {
      String endpoint = Endpoint.getUsers;
      final Map<String, String> parameter = {
        "page": '2',
      };
      final responseJson =
          await _client.get(endpoint, queryParameters: parameter);
      return UserListResponseModel.fromJson(responseJson.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<void> sendUser(
      idTxt, emailTxt, firstNameTxt, lastNameTxt, avatarTxt) async {
    try {
      String endpoint = Endpoint.getUsers;
      final Map<String, String> parameter = {
        "page": '2',
        "id": idTxt,
        "email": emailTxt,
        "first_name": firstNameTxt,
        "last_name": lastNameTxt,
        "avatar": avatarTxt,
      };
      final responseJson =
          await _client.post(endpoint, queryParameters: parameter);

      SnackbarWidget.showSuccessSnackbar(responseJson.data.toString());
    } on DioException catch (_) {
      rethrow;
    }
  }
}

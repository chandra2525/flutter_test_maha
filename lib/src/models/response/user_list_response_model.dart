import '../user_model.dart';

class UserListResponseModel {
  UserListResponseModel(
      {required this.page, required this.perPage, required this.data});

  final int page;
  final int perPage;
  final List<UserModel> data;

  factory UserListResponseModel.fromJson(Map<String, dynamic> json) =>
      UserListResponseModel(
        page: json['page'],
        perPage: json['per_page'],
        data: List<UserModel>.from(
            json['data'].map((x) => UserModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'per_page': perPage,
        'data': data,
      };
}

import 'data.dart';

class LoginDataModel {
  String? accessToken;
  String? refreshToken;
  bool? status;
  Data? user;

  LoginDataModel({
    this.accessToken,
    this.refreshToken,
    this.status,
    this.user,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      status: json['status'] as bool?,
      user: json['user'] == null
          ? null
          : Data.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
        'status': status,
        'user': user?.toJson(),
      };
}

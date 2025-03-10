// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) =>
    ResponseLogin.fromJson(json.decode(str));

class ResponseLogin {
  final String pesan;
  final bool sukses;
  final UserData userData;

  ResponseLogin({
    required this.pesan,
    required this.sukses,
    required this.userData,
  });

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        pesan: json["pesan"],
        sukses: json["sukses"],
        userData: UserData.fromJson(json["user_data"]),
      );
}

class UserData {
  final String userId;
  final String userNama;
  final String userEmail;
  final String userHp;
  final String userPassword;
  final String userStatus;

  UserData({
    required this.userId,
    required this.userNama,
    required this.userEmail,
    required this.userHp,
    required this.userPassword,
    required this.userStatus,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userId: json["user_id"],
        userNama: json["user_nama"],
        userEmail: json["user_email"],
        userHp: json["user_hp"],
        userPassword: json["user_password"],
        userStatus: json["user_status"],
      );
}

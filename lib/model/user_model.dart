import 'package:flutter_ukn_earning_app/model/user_data_model.dart';

class UserModel {
  final bool status;
  final String message;
  final UserData data;

  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null
            ? UserData.fromJson(json["data"])
            : UserData(
                id: 0,
                loginId: 0,
                firstName: "",
                middleName: "",
                lastName: "",
                dateOfBirth: "",
                gender: "",
                contectNumber: "",
                userPoint: 0,
                profilePhoto: "",
                referCode: "",
                userDeviceToken: "",
                emailId: "",
              ),
      );
}

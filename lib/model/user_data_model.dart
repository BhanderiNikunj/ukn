class UserDataModel {
  final bool status;
  final String message;
  final List<UserData> data;

  UserDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null
            ? List<UserData>.from(
                json["data"].map((element) => UserData.fromJson(element)),
              )
            : [],
      );
}

class UserData {
  final int id;
  final int loginId;
  final String firstName;
  final String middleName;
  final String lastName;
  final String dateOfBirth;
  final String gender;
  final String contectNumber;
  final String userPoint;
  final String profilePhoto;
  final String referCode;
  final String userDeviceToken;
  final String emailId;

  UserData({
    required this.id,
    required this.loginId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    required this.contectNumber,
    required this.userPoint,
    required this.profilePhoto,
    required this.referCode,
    required this.userDeviceToken,
    required this.emailId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: int.tryParse(json["id"]?.toString() ?? "0") ?? 0,
        loginId: int.tryParse(json["login_id"]?.toString() ?? "0") ?? 0,
        firstName: json["first_name"]?.toString() ?? "",
        middleName: json["middle_name"]?.toString() ?? "",
        lastName: json["last_name"]?.toString() ?? "",
        dateOfBirth: json["date_of_birth"]?.toString() ?? "",
        gender: json["gender"]?.toString() ?? "",
        contectNumber: json["contect_number"]?.toString() ?? "",
        userPoint: json["user_point"]?.toString() ?? "",
        profilePhoto: json["profile_photo"]?.toString() ?? "",
        referCode: json["refer_code"]?.toString() ?? "",
        userDeviceToken: json["user_device_token"]?.toString() ?? "",
        emailId: json["email_id"]?.toString() ?? "",
      );
}

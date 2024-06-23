class LoginModel {
  final bool status;
  final String message;
  final LoginDataModel data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: LoginDataModel.fromJson(json["data"]),
      );
}

class LoginDataModel {
  final String id;
  final String email;
  final String password;

  LoginDataModel({
    required this.id,
    required this.email,
    required this.password,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        id: json["id"]?.toString() ?? "",
        email: json["email"]?.toString() ?? "",
        password: json["password"]?.toString() ?? "",
      );
}

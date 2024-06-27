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
        data: json["data"] != null
            ? LoginDataModel.fromJson(json["data"])
            : LoginDataModel(
                id: 0,
                email: "",
                password: "",
                isAdmin: false,
              ),
      );
}

class LoginDataModel {
  final int id;
  final String email;
  final String password;
  final bool isAdmin;

  LoginDataModel({
    required this.id,
    required this.email,
    required this.password,
    required this.isAdmin,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        id: int.tryParse(json["id"]?.toString() ?? "0") ?? 0,
        email: json["email"]?.toString() ?? "",
        password: json["password"]?.toString() ?? "",
        isAdmin: bool.tryParse(json["is_admin"]?.toString() ?? "") ?? false,
      );
}

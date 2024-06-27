class CommonModel {
  final bool status;
  final String message;

  CommonModel({required this.status, required this.message});

  factory CommonModel.fromJson(Map<String, dynamic> json) => CommonModel(
        status: json["status"],
        message: json["message"],
      );
}

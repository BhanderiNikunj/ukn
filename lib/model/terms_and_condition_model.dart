class TermsAndConditionModel {
  final bool status;
  final String message;
  final String data;

  TermsAndConditionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TermsAndConditionModel.fromJson(Map<String, dynamic> json) =>
      TermsAndConditionModel(
        status: json["status"],
        message: json["message"]?.toString() ?? "",
        data: json["data"]?.toString() ?? "",
      );
}

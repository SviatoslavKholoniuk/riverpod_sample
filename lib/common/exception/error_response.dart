class ErrorResponse {
  final String? message;
  final String code;
  final String? identifier;
  final String? mdcId;

  ErrorResponse({
    this.message,
    required this.code,
    this.identifier,
    this.mdcId,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['message'],
      code: json['code'],
      identifier: json['identifier'],
      mdcId: json['mdcId'],
    );
  }
}
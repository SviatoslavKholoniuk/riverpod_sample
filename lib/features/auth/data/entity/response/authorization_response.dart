import 'package:json_annotation/json_annotation.dart';

part 'authorization_response.g.dart';

@JsonSerializable()
class AuthorizationResponse {
  final String name;
  final AuthorizationTokenResponse authorizationToken;

  AuthorizationResponse({
    required this.name,
    required this.authorizationToken,
  });

  factory AuthorizationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationResponseToJson(this);
}

@JsonSerializable()
class AuthorizationTokenResponse {
  final String token;
  final DateTime expiresAt;

  AuthorizationTokenResponse({required this.token, required this.expiresAt});

  factory AuthorizationTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationTokenResponseToJson(this);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class Auth with _$Auth {
  const factory Auth({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'user') required UserModel user,
  }) = AuthModel;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
  }) = UserModel;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

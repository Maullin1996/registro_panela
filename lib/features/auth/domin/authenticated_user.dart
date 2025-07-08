import 'package:freezed_annotation/freezed_annotation.dart';
part 'authenticated_user.freezed.dart';
part 'authenticated_user.g.dart';

@JsonEnum()
enum UserRole {
  @JsonValue('admin')
  admin,
  @JsonValue('stage1')
  stage1,
  @JsonValue('stage2')
  stage2,
  @JsonValue('stage3')
  stage3,
  @JsonValue('stage4')
  stage4,
  @JsonValue('stage5')
  stage5,
}

@freezed
abstract class AuthenticatedUser with _$AuthenticatedUser {
  const factory AuthenticatedUser({
    required String id,
    required String name,
    required String email,
    required UserRole role,
    required String token,
  }) = _AuthenticatedUser;

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedUserFromJson(json);
}

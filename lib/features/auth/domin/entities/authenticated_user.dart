import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registro_panela/features/auth/domin/enums/user_role.dart';
part 'authenticated_user.freezed.dart';
part 'authenticated_user.g.dart';

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

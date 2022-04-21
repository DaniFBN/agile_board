
import '../../domain/entities/user_entity.dart';

class UserMapper extends UserEntity {
  const UserMapper({
    required String email,
    required String name,
  }) : super(
          email: email,
          name: name,
        );

  factory UserMapper.fromMap(Map<String, dynamic> map) {
    return UserMapper(
      email: map['email'] as String,
      name: map['name'] as String,
    );
  }
}

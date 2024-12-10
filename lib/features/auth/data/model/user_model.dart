import 'package:firebase_auth/firebase_auth.dart';
import 'package:frute_hup/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.email, required super.name, required super.uid});

  factory UserModel.fromFirebase(User user) => UserModel(
      email: user.email ?? "", name: user.displayName ?? "", uid: user.uid);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }
  @override
  List<Object?> get props => [email, name, uid];
}

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String name;
  final String uid;
  const UserEntity({required this.email, required this.name, required this.uid});

  toJson() => {'email': email, 'name': name, 'uid': uid};
  @override
  List<Object?> get props => [email, name, uid];
}

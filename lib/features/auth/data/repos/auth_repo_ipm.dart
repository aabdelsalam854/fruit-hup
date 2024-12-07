import 'package:dartz/dartz.dart';
import 'package:frute_hup/core/errors/exception.dart';
import 'package:frute_hup/core/errors/failure.dart';
import 'package:frute_hup/features/auth/data/model/user_model.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoIpm implements AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoIpm({required this.firebaseAuthServices});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await firebaseAuthServices.loginWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final user = await firebaseAuthServices.loginWithGoogle();
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    try {
      final user = await firebaseAuthServices.loginWithFacebook();
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}

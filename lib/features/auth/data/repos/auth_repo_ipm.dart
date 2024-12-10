import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frute_hup/core/errors/exception.dart';
import 'package:frute_hup/core/errors/failure.dart';
import 'package:frute_hup/core/services/database_services.dart';
import 'package:frute_hup/features/auth/data/model/user_model.dart';
import '../../../../core/constant/end_point.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoIpm implements AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseServices databaseServices;

  AuthRepoIpm(
      {required this.firebaseAuthServices, required this.databaseServices});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password, name: name);
      var userEntity = UserEntity(
        email: email,
        name: name,
        uid: user.uid,
      );
      await addUserData(user: userEntity);
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await firebaseAuthServices.loginWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uid: user.uid);
      log(userEntity.toString());
      return right(userEntity);
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

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseServices.addData(
        docId: user.uid, data: user.toJson(), path: EndPoint.addUserData);
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData =
        await databaseServices.getData(path: EndPoint.addUserData, docId: uid);
          log(userData.toString());
    return UserModel.fromJson(userData);
  }
}

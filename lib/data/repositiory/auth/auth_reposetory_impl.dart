import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/sources/auth/auth__firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthReposetoryImpl extends AuthRepository {
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq)async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

}
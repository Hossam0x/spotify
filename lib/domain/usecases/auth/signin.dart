import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/signIn_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SigninUseCase extends Usecase<Either,SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async{
    return  sl<AuthRepository>().signIn(params!);
  }
}
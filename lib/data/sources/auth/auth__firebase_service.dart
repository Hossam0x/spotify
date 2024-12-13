import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService{
    Future<Either>signup(CreateUserReq createUserReq);
      Future<void>signIn();


}

class FirebaseAuthServiceImpl extends AuthFirebaseService{
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq)async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
         password: createUserReq.password
         );
         return const Right("Signup successful");

    }on FirebaseAuthException catch (e) {
      String message ="" ;
      if(e.code == 'weak-password'){
        message = "Password Provided is too weak";
      }
      else if (e.code == 'email-aleady-in-use'){
        message = 'An account already exists with that email';
      }
      return Left(message);

    }
  }


}
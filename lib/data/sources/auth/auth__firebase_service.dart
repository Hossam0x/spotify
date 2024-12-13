import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signIn_user_req.dart';

abstract class AuthFirebaseService{
    Future<Either>signup(CreateUserReq createUserReq);
      Future<Either>signIn(SigninUserReq signInUserReq);


}

class FirebaseAuthServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> signIn(SigninUserReq signInUserReq) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInUserReq.email,
       password: signInUserReq.password
       );
       return const Right("Welcome Again..");
    }
    on FirebaseAuthException catch(e)
    {
      String message = "";
      if (e.code == 'invalid-credentials') {
        message = 'Wrong Password providing for that user';
      } else if (e.code == 'invalid-email') {
        message = 'No user found with that email';
      } else if (e.code == 'network-error') {
        message = 'Network error';
      } else {
        message = 'An error occurred';
      }
      return Left(message);
    }
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
import 'package:get_it/get_it.dart';
import 'package:spotify/data/repositiory/auth/auth_reposetory_impl.dart';
import 'package:spotify/data/sources/auth/auth__firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies()async{
  sl.registerSingleton<AuthFirebaseService>(
    FirebaseAuthServiceImpl()
  );
  sl.registerSingleton<AuthRepository>(
    AuthReposetoryImpl()
  );
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );
}
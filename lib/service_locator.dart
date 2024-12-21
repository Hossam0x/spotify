import 'package:get_it/get_it.dart';
import 'package:spotify/data/repositiory/auth/auth_reposetory_impl.dart';
import 'package:spotify/data/repositiory/song/song_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth__firebase_service.dart';
import 'package:spotify/data/sources/song/song_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/add_or_remove_favorite.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/domain/usecases/song/get_playList.dart';
import 'package:spotify/domain/usecases/song/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  sl.registerSingleton<AuthFirebaseService>(FirebaseAuthServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthReposetoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());

  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<GetPlaylistUseCase>(GetPlaylistUseCase());
  sl.registerSingleton<AddOrRemoveFavoriteUseCase>(AddOrRemoveFavoriteUseCase());
  sl.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());
}

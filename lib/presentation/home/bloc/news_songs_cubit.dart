import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/presentation/home/bloc/new_songs_state.dart';
import 'package:spotify/service_locator.dart';

class NewsSongsCubit extends Cubit<NewSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewSongs() async {
    var returnedsongs = await sl<GetNewsSongsUseCase>().call();

    returnedsongs.fold((erro) {
      emit(NewSongsLoadfalure());
    }, (data) {
      emit(NewsSongsLoaded(songs: data));
    });
  }
}

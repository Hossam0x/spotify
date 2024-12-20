import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/domain/usecases/song/get_playList.dart';
import 'package:spotify/presentation/home/bloc/new_songs_state.dart';
import 'package:spotify/presentation/home/bloc/playList_state.dart';
import 'package:spotify/service_locator.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedsongs = await sl<GetPlaylistUseCase>().call();

    returnedsongs.fold((erro) {
      emit(PlayListLoadFailure());
    }, (data) {
      emit(PlayListLoaded(songs: data));
    });
  }
}

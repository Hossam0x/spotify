import 'package:spotify/domain/entities/song/song.dart';

abstract class PlaylistState {}

class PlayListLoading extends PlaylistState {}

class PlayListLoaded extends PlaylistState {
  final List<SongEntiy> songs ;

  PlayListLoaded({required this.songs});
}

class PlayListLoadFailure extends PlaylistState {
}
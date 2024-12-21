import 'dart:ffi';

import 'package:dartz/dartz.dart';

abstract class SongsRepository {

  Future<Either> getNewSongs();
  Future<Either> getPlayList();
  Future<Either>addOrRemoveFavoriteSong(String songId) ;
  Future<bool>isFavoriteSong(String songId) ;
}
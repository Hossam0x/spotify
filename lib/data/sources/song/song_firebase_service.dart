import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';

abstract class SongFirebaseService{

  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
}

class SongFirebaseServiceImpl extends SongFirebaseService{
  @override
  Future<Either> getNewsSongs()async {
    try {
  List<SongEntiy> songs =[] ;
  var data = await FirebaseFirestore.instance.collection('Songs').orderBy('releaseDate',descending: true).limit(3).get();
  
  for (var doc in data.docs) {
    var songmodel = SongModel.fromjson(doc.data());
  
    //need to add new entity in songmodel to convert songmodel to entity
    songs.add(songmodel.toEntity());
  
  
  }
  return Right (songs) ;
}  catch (e) {
  log(e.toString());
  return left ('an error occurred , please try again');
}
    
  }
  
  @override
  Future<Either> getPlayList() async{
    try  {
          List<SongEntiy> playListSongs =[] ;
          var playlist = await FirebaseFirestore.instance.collection('Songs').orderBy('releaseDate',descending: true ).get();
          log(playlist.toString());

          for(var i in playlist.docs){
            var songmodel= SongModel.fromjson(i.data());
            playListSongs.add(songmodel.toEntity());
          }
          return Right (playListSongs) ;
}  catch (e) {
  log(e.toString());
    return left ('an error occurred , please try again');
}
    
  }

}

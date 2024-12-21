import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/domain/usecases/song/is_favorite_song.dart';
import 'package:spotify/service_locator.dart';

abstract class SongFirebaseService{

  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavoriteSong(String songId) ;
  Future<bool> isFavoriteSong(String songId) ;
}

class SongFirebaseServiceImpl extends SongFirebaseService{
  @override
  Future<Either> getNewsSongs()async {
    try {
  List<SongEntiy> songs =[] ;
  var data = await FirebaseFirestore.instance.collection('Songs').orderBy('releaseDate',descending: true).limit(3).get();
  
  for (var doc in data.docs) {
    var songmodel = SongModel.fromjson(doc.data());
    bool isFav = await sl<IsFavoriteSongUseCase>().call(
      params: doc.reference.id
    );
    songmodel.isFavorite = isFav ;
    songmodel.songId = doc.reference.id ;
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
            bool isFav = await sl<IsFavoriteSongUseCase>().call(
              params: i.reference.id
    );
            songmodel.isFavorite = isFav ;
            songmodel.songId = i.reference.id ;
            playListSongs.add(songmodel.toEntity());
          }
          return Right (playListSongs) ;
}  catch (e) {
  log(e.toString());
    return left ('an error occurred , please try again');
}
    
  }
  
  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async{
    try {
  late bool isFavorite ;    
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance ;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance ;
  var user = await firebaseAuth.currentUser ;
  String uid = user!.uid ;
  var favoriteSongs = await firebaseFirestore.collection('Users').doc(uid).collection('Favorites').where(
    'songId' , isEqualTo: songId
  ).get();
  
  if(favoriteSongs.docs.isNotEmpty){
    await favoriteSongs.docs.first.reference.delete() ;
    isFavorite = false ;
  }else{
    firebaseFirestore.collection('Users').doc(uid).collection('Favorites').add(
      {
        "songId": songId,
        'addedDate': Timestamp.now()
      }
    );
    isFavorite = true ;
  }
  return Right(isFavorite );
}  catch (e) {
  return Left('An error occurred');
}
  }
  
  @override
  Future<bool> isFavoriteSong(String songId) async{
     try {
  late bool isFavorite ;    
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance ;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance ;
  var user = await firebaseAuth.currentUser ;
  String uid = user!.uid ;
  var favoriteSongs = await firebaseFirestore.collection('Users').doc(uid).collection('Favorites').where(
    'songId' , isEqualTo: songId
  ).get();
  
  if(favoriteSongs.docs.isNotEmpty){
    return true ;
  }else{
    
   return false ;
  }
}  catch (e) {
  return false ;
}
  }

}

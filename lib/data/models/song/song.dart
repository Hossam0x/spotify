import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/song/song.dart';

class SongModel {
   String? title;
   String? artist;
   num? duration;
   Timestamp? releaseDate;
   String? coverUrl ;
   String? songUrl ;
   bool? isFavorite ;
   String? songId ;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    this.coverUrl,
    this.songUrl,
    required this.isFavorite, 
    required this.songId 
  });

  SongModel.fromjson(Map<String,dynamic> data){
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
    coverUrl = data['coverUrl'];
    songUrl = data['songUrl'];
  }
}

extension SongModelX on SongModel {
  SongEntiy toEntity(){
    return SongEntiy(
      artist:artist!,
      title: title!,
      duration: duration!,
      releaseDate: releaseDate!,
      coverUrl: coverUrl,
      songUrl: songUrl,
      isFavorite: isFavorite!, 
      songId: songId!


       );
  }
}

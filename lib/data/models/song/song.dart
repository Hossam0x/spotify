import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/song/song.dart';

class SongModel {
   String? title;
   String? artist;
   num? duration;
   Timestamp? releaseDate;
   String? coverUrl ;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    this.coverUrl,
  });

  SongModel.fromjson(Map<String,dynamic> data){
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
    coverUrl = data['coverUrl'];
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

       );
  }
}

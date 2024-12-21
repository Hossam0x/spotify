import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntiy {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final String? coverUrl ;
  final String? songUrl ;
  final bool isFavorite ;
  final String songId ;

  SongEntiy({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    this.coverUrl,
    this.songUrl,
    required this.isFavorite,
    required this.songId,
  });

  
}

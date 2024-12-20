import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntiy {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final String? coverUrl ;

  SongEntiy({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    this.coverUrl,
  });

  
}

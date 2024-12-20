import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/repositiory/song/song_repository_impl.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

class GetNewsSongsUseCase implements Usecase <Either ,dynamic> {
  @override
  Future<Either> call({params}) async{
    return await sl<SongsRepository>().getNewSongs() ;
  }


}
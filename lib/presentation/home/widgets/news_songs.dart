import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/core/configs/app_colors.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/new_songs_state.dart';
import 'package:spotify/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify/presentation/song_player/pages/song_player.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsSongsCubit()..getNewSongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<NewsSongsCubit, NewSongsState>(
            builder: (context, state) {
              if (state is NewsSongsLoading) {
                return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator());
              }
              if (state is NewsSongsLoaded) {
                return _songs(state.songs);
              }

              return Container();
            },
          )),
    );
  }

  Widget _songs(List<SongEntiy> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>  SongPlayerPage(songEntity: songs[index],)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: 150, // تحديد العرض
                  height: 150, // تحديد الارتفاع
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(songs[index].coverUrl!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      transform: Matrix4.translationValues(1, 10, 0),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: context.isDarkMode
                            ? const Color(0xff959595)
                            : const Color(0xff555555),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.isDarkMode
                              ? AppColors.darkgrey
                              : const Color(0xffE6E6E6)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                songs[index].title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                songs[index].artist,
                style: const TextStyle(fontWeight: FontWeight.w400),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 14,
      ),
      itemCount: songs.length,
    );
  }
}

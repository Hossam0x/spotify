import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/core/configs/app_colors.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/playList_cubit.dart';
import 'package:spotify/presentation/home/bloc/playList_state.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaylistCubit()..getPlayList(),
      child:
          BlocBuilder<PlaylistCubit, PlaylistState>(builder: (context, state) {
        if (state is PlayListLoading) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
        if (state is PlayListLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PlayList',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "See More",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xffc6c6c6)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _songs(state.songs),
                ],
              ),
            ),
          );
        }

        return Container();
      }),
    );
  }

  Widget _songs(List<SongEntiy> songs) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.isDarkMode
                          ? AppColors.darkgrey
                          : const Color(0xffE6E6E6),
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: context.isDarkMode
                          ? const Color(0xff959595)
                          : Color(0xff555555),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(songs[index].artist)
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text(songs[index].duration.toString().replaceAll('.', ':')),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border_rounded))
                ],
              )
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
        itemCount: songs.length,
      ),
    );
  }
}

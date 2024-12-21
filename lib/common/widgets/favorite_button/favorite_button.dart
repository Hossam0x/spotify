import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:spotify/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:spotify/core/configs/app_colors.dart';
import 'package:spotify/domain/entities/song/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntiy songEntiy;
  const FavoriteButton({super.key, required this.songEntiy});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
          builder: (context, state) {
        if (state is FavoriteButtonInitial) {
          return IconButton(
            onPressed: () {
              context
                  .read<FavoriteButtonCubit>()
                  .favoriteButtonUpdated(songEntiy.songId);
            },
            icon: Icon(
              songEntiy.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_outline_outlined,
              size: 25,
              color: songEntiy.isFavorite ? Colors.red : AppColors.darkgrey,
            ),
          );
        }
        if (state is FavoriteButtonUpdated) {
          return IconButton(
            onPressed: () {
              context
                  .read<FavoriteButtonCubit>()
                  .favoriteButtonUpdated(songEntiy.songId);
            },
            icon: Icon(
              state.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_outline_outlined,
              size: 25,
              color: state.isFavorite ? Colors.red : AppColors.darkgrey,
            ),
          );
        }

        return Container();
      }),
    );
  }
}

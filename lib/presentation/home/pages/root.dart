import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/app_colors.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify/presentation/home/widgets/news_songs.dart';
import 'package:spotify/presentation/home/widgets/playlist.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _Tabs(),
            SizedBox(
              height: 268,
              child: TabBarView(
                  controller: _tabController,
                  children: [NewsSongs(), Container(), Container(), Container()]),
            ),
            Playlist()
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: Container(
        height: 150,
        child: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.homeToCard)),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Image.asset(AppImages.homeArtist),
              ))
        ]),
      ),
    );
  }

  Widget _Tabs() {
    return TabBar(
      indicatorColor: AppColors.primary,
      // isScrollable: true,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      controller: _tabController,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      tabs: const [
        Text(
          'News',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text("Videos",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        Text("Artists",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        Text("Podcasts",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14))
      ],
    );
  }
}

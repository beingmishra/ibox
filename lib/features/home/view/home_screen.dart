import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/helpers/general_functions.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/config/widgets/movie_card.dart';
import 'package:ibox/features/home/controller/home_controller.dart';
import 'package:ibox/features/home/widgets/big_slider_card.dart';
import 'package:ibox/features/home/widgets/skeleton_home_screen.dart';
import 'package:ibox/network/url_helper.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(HomeController());
  bool isLoading = false;
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: isLoading ? const SkeletonHomeScreen() : SingleChildScrollView(
        child: Column(
          children: [
            buildTrendingSlider(size),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  buildMostPopularMovies(size),
                  buildTopRatedMovies(size),
                  buildAiringTodayTV(size),
                  buildMostPopularTV(size),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    await controller.fetchTrendingMedia();
    await controller.fetchMovieNowPlaying();
    await controller.fetchMoviePopular();
    await controller.fetchTvAiringToday();
    await controller.fetchTvPopular();

    setState(() {
      isLoading = false;
    });
  }

  buildTrendingSlider(Size size) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.65,
          child: PageView(
            controller: pageController,
            children: List.generate(controller.trendingMediaItems.take(7).length, (index) => BigSliderCard(data: controller.trendingMediaItems[index],)),
          ),
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }

  buildMostPopularMovies(Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Now Playing (Movies)",
              style:
                  GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "View all",
              style:
                  GoogleFonts.rubik(fontSize: 14, color: AppColors.hintColor),
            ),
          ],
        ),
        verticalGap(16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 12,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 12,
            children: List.generate(controller.movieNowPlayingItems.length, (index) => MovieCard(
                image: getImageUrl(controller.movieNowPlayingItems[index].posterPath, "media"),
                name: controller.movieNowPlayingItems[index].title,
                id:  controller.movieNowPlayingItems[index].id, mediaType: "movie")),
          ),
        ),
        verticalGap(32),
      ],
    );
  }

  buildTopRatedMovies(Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Most Popular (Movies)",
              style:
                  GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "View all",
              style:
                  GoogleFonts.rubik(fontSize: 14, color: AppColors.hintColor),
            ),
          ],
        ),
        verticalGap(16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 12,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 12,
            children: List.generate(controller.moviePopularItems.length, (index) => MovieCard(
                image: getImageUrl(controller.moviePopularItems[index].posterPath, "media"),
                name: controller.moviePopularItems[index].title,
                id:  controller.moviePopularItems[index].id, mediaType: "movie")),
          ),
        ),
        verticalGap(32),
      ],
    );
  }

  buildAiringTodayTV(Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Airing Today (TV Shows)",
              style:
                  GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "View all",
              style:
                  GoogleFonts.rubik(fontSize: 14, color: AppColors.hintColor),
            ),
          ],
        ),
        verticalGap(16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 12,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 12,
            children: List.generate(controller.tvAiringTodayItems.length, (index) => MovieCard(
                image: getImageUrl(controller.tvAiringTodayItems[index].posterPath, "media"),
                name: controller.tvAiringTodayItems[index].name,
                id:  controller.tvAiringTodayItems[index].id, mediaType: "tv")),
          ),
        ),
        verticalGap(32),
      ],
    );
  }

  buildMostPopularTV(Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Most Popular (TV Shows)",
              style:
                  GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              "View all",
              style:
                  GoogleFonts.rubik(fontSize: 14, color: AppColors.hintColor),
            ),
          ],
        ),
        verticalGap(16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: 12,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 12,
            children: List.generate(controller.tvPopularItems.length, (index) => MovieCard(
                image: getImageUrl(controller.tvPopularItems[index].posterPath, "media"),
                name: controller.tvPopularItems[index].name,
                id:  controller.tvPopularItems[index].id, mediaType: "tv")),
          ),
        ),
        verticalGap(32),
      ],
    );
  }
}

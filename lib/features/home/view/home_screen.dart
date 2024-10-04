import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/config/widgets/movie_card.dart';
import 'package:ibox/features/home/controller/home_controller.dart';
import 'package:ibox/features/home/widgets/big_slider_card.dart';
import 'package:ibox/features/home/widgets/skeleton_home_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(HomeController());
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: isLoading ? SkeletonHomeScreen() : SingleChildScrollView(
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

    /*await Future.wait([
      controller.fetchTrendingMedia(),
      controller.fetchMovieNowPlaying(),
      controller.fetchMoviePopular(),
      controller.fetchTvAiringToday(),
      controller.fetchTvPopular(),
    ]);*/
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      isLoading = false;
    });
  }

  buildTrendingSlider(Size size) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.65,
          child: Skeleton.leaf(
            enabled: isLoading,
            child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const BigSliderCard();
                }),
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
            children: List.generate(5, (index) => const MovieCard()),
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
              "Top Rated (Movies)",
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
            children: List.generate(5, (index) => const MovieCard()),
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
            children: List.generate(5, (index) => const MovieCard()),
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
            children: List.generate(5, (index) => const MovieCard()),
          ),
        ),
        verticalGap(32),
      ],
    );
  }
}

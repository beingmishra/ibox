import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/helpers/gener_helper.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/config/widgets/movie_card.dart';
import 'package:ibox/config/widgets/no_data_widget.dart';
import 'package:ibox/features/detail/controllers/movie_detail_controller.dart';
import 'package:ibox/features/detail/widgets/skeleton_detail_page.dart';
import 'package:ibox/network/url_helper.dart';

class MovieDetailScreen extends StatefulWidget {
  final int id;
  const MovieDetailScreen({super.key, required this.id});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  final controller = Get.put(MovieDetailController());
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
      body: isLoading ? const SkeletonDetailPage() : controller.movieDetail == null ?
            const NoDataWidget()
          : SingleChildScrollView(
        child: Stack(
          children: [
            buildTopHeader(size),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalGap(size.height * 0.55 + 16),
                  Text("The Plot",
                      style: GoogleFonts.rubik(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                  verticalGap(8),
                  Text(
                      controller.movieDetail!.overview,
                      style: GoogleFonts.rubik(
                          color: AppColors.textSecondaryColor)),
                  verticalGap(24),
                  Text("Casts",
                      style: GoogleFonts.rubik(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                  verticalGap(12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 12,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runSpacing: 12,
                      children: List.generate(controller.movieCredits!.cast.length, (index) => SizedBox(
                                width: 64,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        UrlHelper.imageUrl + (controller.movieCredits!.cast[index].profilePath ?? ""),
                                        height: 64,
                                        width: 64,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    verticalGap(8),
                                    Text(controller.movieCredits!.cast[index].name,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.rubik(fontSize: 14)),
                                    verticalGap(4),
                                    Text("(${controller.movieCredits!.cast[index].character})",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.rubik(fontSize: 14)),
                                  ],
                                ),
                              )),
                    ),
                  ),
                  verticalGap(24),
                  buildRecommendations(size),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTopHeader(Size size) {
    return SizedBox(
      height: size.height * 0.55,
      width: size.width,
      child: Stack(
        children: [
          Image.network(
            UrlHelper.imageUrl + controller.movieDetail!.posterPath,
            fit: BoxFit.cover,
            height: size.height * 0.55,
            width: size.width,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.35,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                    0,
                    0.5,
                    0.7
                  ],
                      colors: [
                    Colors.transparent,
                    Color(0x510E1116),
                    AppColors.scaffoldDarkColor
                  ])),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    height: 42,
                    width: 42,
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow_sharp,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  verticalGap(12),
                  Text(
                    controller.movieDetail!.title,
                    style: GoogleFonts.rubik(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  verticalGap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.movieDetail!.releaseDate.year.toString(), style: GoogleFonts.rubik(fontSize: 12)),
                      horizontalGap(8),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      horizontalGap(8),
                      Text(genreStringFromObj(controller.movieDetail!.genres),
                          style: GoogleFonts.rubik(fontSize: 12)),
                    ],
                  ),
                  verticalGap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      horizontalGap(4),
                      Text(controller.movieDetail!.voteAverage.toStringAsFixed(1), style: GoogleFonts.rubik(fontSize: 12)),
                      horizontalGap(4),
                      Text("(${controller.movieDetail!.voteCount} reviews)",
                          style: GoogleFonts.rubik(
                              fontSize: 12,
                              color: AppColors.textSecondaryColor)),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  buildRecommendations(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommendations",
          style:
          GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600),
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
            children: List.generate(controller.movieRecommendations!.results.length, (index) => MovieCard(
                image: UrlHelper.imageUrl + controller.movieRecommendations!.results[index].posterPath,
                name: controller.movieRecommendations!.results[index].title,
                id:  controller.movieRecommendations!.results[index].id, mediaType: "movie")),
          ),
        ),
        verticalGap(32),
      ],
    );
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    await controller.fetchMovieDetail(widget.id);
    await controller.fetchMovieCredits(widget.id);
    await controller.fetchMovieRecommendations(widget.id);

    setState(() {
      isLoading = false;
    });
  }
}

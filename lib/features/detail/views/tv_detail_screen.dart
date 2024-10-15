import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/helpers/gener_helper.dart';
import 'package:ibox/config/helpers/general_functions.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/config/widgets/movie_card.dart';
import 'package:ibox/config/widgets/no_data_widget.dart';
import 'package:ibox/features/common/views/youtube_player_screen.dart';
import 'package:ibox/features/detail/controllers/tv_detail_controller.dart';
import 'package:ibox/features/detail/widgets/skeleton_detail_page.dart';
import 'package:ibox/features/people/views/people_info_screen.dart';

class TvDetailScreen extends StatefulWidget {
  final int id;
  const TvDetailScreen({super.key, required this.id});

  @override
  State<TvDetailScreen> createState() => _TvDetailScreenState();
}

class _TvDetailScreenState extends State<TvDetailScreen> {
  final controller = Get.put(TvDetailController());
  bool isLoading = false;
  bool isLoadingEps = false;
  bool showAllEps = false;
  int selectedSeason = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: isLoading
          ? const SkeletonDetailPage()
          : controller.tvDetail == null
              ? const NoDataWidget()
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
                            Text(controller.tvDetail!.overview,
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
                                children: List.generate(
                                    controller.tvDetail!.credits.cast.length,
                                    (index) => InkWell(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PeopleInfoScreen(
                                                          id: controller
                                                              .tvDetail!
                                                              .credits
                                                              .cast[index]
                                                              .id))),
                                          child: SizedBox(
                                            width: 80,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                // Cast member's image
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(50), // Circular image with smoother radius
                                                  child: Image.network(
                                                    getImageUrl(controller.tvDetail!.credits.cast[index].profilePath, "person"),
                                                    height: 80,
                                                    width: 80,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                verticalGap(8),

                                                // Cast member's name
                                                Text(
                                                  controller.tvDetail!.credits.cast[index].name,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.rubik(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                  maxLines: 2, // Prevent overflow
                                                  overflow: TextOverflow.ellipsis, // Handle long names
                                                ),
                                                verticalGap(4),

                                                // Character name
                                                Text(
                                                  "(${controller.tvDetail!.credits.cast[index].character})",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.rubik(
                                                    fontSize: 12,
                                                    color: Colors.grey, // Muted color for character role
                                                  ),
                                                  maxLines: 1, // Prevent overflow
                                                  overflow: TextOverflow.ellipsis, // Handle long names
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                              ),
                            ),
                            verticalGap(24),
                            buildSeasonSection(size),
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
            getImageUrl(controller.tvDetail!.posterPath, "media"),
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
                  InkWell(
                    onTap : () {
                      var item = controller.tvDetail!.videos.results.firstWhereOrNull((data) => data.type.toLowerCase() == "trailer");

                      if(item != null) {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => YoutubePlayerScreen(videoId: item.key ?? "")));
                      }else{
                        showNoTrailerDialog(context);
                      }
                    },
                    child: Container(
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
                  ),
                  verticalGap(12),
                  Text(
                    controller.tvDetail!.name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  verticalGap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.tvDetail!.firstAirDate.year.toString(),
                          style: GoogleFonts.rubik(fontSize: 12)),
                      horizontalGap(8),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      horizontalGap(8),
                      Text(genreStringFromObj(controller.tvDetail!.genres.take(3).toList()),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
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
                      Text(controller.tvDetail!.voteAverage.toStringAsFixed(1),
                          style: GoogleFonts.rubik(fontSize: 12)),
                      horizontalGap(4),
                      Text("(${controller.tvDetail!.voteCount} reviews)",
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
    return controller.tvDetail!.similar.results.isEmpty
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recommendations",
                style: GoogleFonts.rubik(
                    fontSize: 18, fontWeight: FontWeight.w600),
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
                  children: List.generate(
                      controller.tvDetail!.similar.results.length,
                      (index) => MovieCard(
                          image: getImageUrl(
                              controller
                                  .tvDetail!.similar.results[index].posterPath,
                              "media"),
                          name:
                              controller.tvDetail!.similar.results[index].name,
                          id: controller.tvDetail!.similar.results[index].id,
                          mediaType: "tv")),
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

    await controller.fetchTvDetail(widget.id);
    await fetchSeasonInfo();

    setState(() {
      isLoading = false;
    });
  }

  buildSeasonSection(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Seasons",
            style:
                GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600)),
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
            children: List.generate(
                controller.tvDetail!.seasons.length,
                (index) => InkWell(
                      onTap: () => setState(() {
                        selectedSeason = index;
                        fetchSeasonInfo();
                      }),
                      child: Container(
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                            color: selectedSeason == index
                                ? AppColors.primaryColor
                                : AppColors.cardDarkColor,
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(16),
                        child: Center(
                            child: Text(
                          controller.tvDetail!.seasons[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.rubik(),
                        )),
                      ),
                    )),
          ),
        ),
        verticalGap(16),
        isLoadingEps ? const LinearProgressIndicator(color: AppColors.primaryColor,) : ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: showAllEps ? controller.seasonDetail!.episodes.length : controller.seasonDetail!.episodes.length > 10
              ? 10
              : controller.seasonDetail!.episodes.length,
          itemBuilder: (context, index) {
            var data = controller.seasonDetail!.episodes[index];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    getImageUrl(data.stillPath, "media"),
                    fit: BoxFit.cover,
                    height: 80,
                    width: size.width * 0.3,
                  ),
                ),
                horizontalGap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: GoogleFonts.rubik(fontSize: 18),
                      ),
                      verticalGap(8),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          horizontalGap(4),
                          Text(data.voteAverage.toStringAsFixed(1),
                              style: GoogleFonts.rubik(fontSize: 12)),
                        ],
                      ),
                      verticalGap(8),
                      Text(
                        data.overview.isEmpty ? "-" : data.overview,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.rubik(
                            color: AppColors.textSecondaryColor),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: AppColors.hintColor,
              ),
            );
          },
        ),
        Visibility(
          visible: (controller.seasonDetail?.episodes.length ?? 0) > 10,
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => setState(() {
                showAllEps = !showAllEps;
              }),
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(showAllEps ? "Show less" : "Show More", style: GoogleFonts.rubik(
                  color: AppColors.hintColor
                ),),
              ),
            ),
          ),
        ),
        verticalGap(24),
      ],
    );
  }

  Future<void> fetchSeasonInfo() async {

    setState(() {
      isLoadingEps = true;
    });

    if (controller.tvDetail != null) {
      await controller.fetchSeasonInfo(
          controller.tvDetail!.seasons[selectedSeason].seasonNumber,
          controller.tvDetail!.id);
    }

    setState(() {
      isLoadingEps = false;
    });
  }
}

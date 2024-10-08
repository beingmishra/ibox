import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/helpers/general_functions.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/config/widgets/movie_card.dart';
import 'package:ibox/config/widgets/no_data_widget.dart';
import 'package:ibox/features/people/controller/people_controller.dart';
import 'package:ibox/features/people/widgets/skeleton_person_page.dart';
import 'package:ibox/network/url_helper.dart';
import 'package:intl/intl.dart';

class PeopleInfoScreen extends StatefulWidget {
  final int id;
  const PeopleInfoScreen({super.key, required this.id});

  @override
  State<PeopleInfoScreen> createState() => _PeopleInfoScreenState();
}

class _PeopleInfoScreenState extends State<PeopleInfoScreen> {

  final controller = Get.put(PeopleController());
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: isLoading ? const SkeletonPersonPage() : controller.personDetail == null ? const NoDataWidget() : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.45,
              width: size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Opacity(
                    opacity: 0.3,
                    child: Image.network(getImageUrl(controller.personDetail!.profilePath, "person"),
                      height: size.height * 0.45,
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * 0.5,
                      width: size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [
                                0,
                                0.5,
                                0.75
                              ],
                              colors: [
                                Colors.transparent,
                                Color(0x510E1116),
                                AppColors.scaffoldDarkColor
                              ])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Image.network(getImageUrl(controller.personDetail!.profilePath, "person"),
                            height: 145,
                            width: 145,
                            fit: BoxFit.cover,
                          ),
                        ),
                        verticalGap(16),
                        Text(controller.personDetail!.name, style: GoogleFonts.rubik(fontSize: 24, fontWeight: FontWeight.w600),),
                        verticalGap(16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            Visibility(
                              visible: controller.personDetail!.birthday != null,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("🎂", style: GoogleFonts.rubik(fontSize: 22),),
                                    horizontalGap(8),
                                    Text(DateFormat("dd MMM yyyy").format(controller.personDetail!.birthday ?? DateTime.now()), style: GoogleFonts.rubik()),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: controller.personDetail!.deathday != null,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("☠️", style: GoogleFonts.rubik(fontSize: 22),),
                                    horizontalGap(8),
                                    Text(DateFormat("dd MMM yyyy").format(controller.personDetail!.deathday ?? DateTime.now()), style: GoogleFonts.rubik()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Biography",
                      style: GoogleFonts.rubik(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                  verticalGap(8),
                  Text(
                      controller.personDetail!.biography.isEmpty ? "No data available" : controller.personDetail!.biography,
                      style: GoogleFonts.rubik(
                          color: AppColors.textSecondaryColor)),
                  verticalGap(32),
                  buildMovies(size),
                  buildTvShows(size),
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

    await controller.fetchPersonDetail(widget.id);

    setState(() {
      isLoading = false;
    });
  }

  buildMovies(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Movies",
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
            children: List.generate(controller.personDetail!.movieCredits.cast.length, (index) => MovieCard(
                image: getImageUrl(controller.personDetail!.movieCredits.cast[index].posterPath, "media"),
                name: controller.personDetail!.movieCredits.cast[index].title,
                id:  controller.personDetail!.movieCredits.cast[index].id, mediaType: "movie")),
          ),
        ),
        verticalGap(32),
      ],
    );
  }

  buildTvShows(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tv Shows",
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
            children: List.generate(controller.personDetail!.tvCredits.cast.length, (index) => MovieCard(
                image: getImageUrl(controller.personDetail!.tvCredits.cast[index].posterPath, "media"),
                name: controller.personDetail!.tvCredits.cast[index].name,
                id:  controller.personDetail!.tvCredits.cast[index].id, mediaType: "movie")),
          ),
        ),
        verticalGap(32),
      ],
    );
  }
}

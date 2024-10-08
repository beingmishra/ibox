import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/helpers/general_functions.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/config/widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cardDarkColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                padding: const EdgeInsets.only(left: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search here",
                    hintStyle: GoogleFonts.rubik(color: AppColors.textSecondaryColor),
                    suffixIcon: const Icon(Icons.search)
                  ),
                ),
              ),
              verticalGap(32),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildPersonItems(size),
                      buildMovieItems(size),
                      buildTvItems(size),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildNoData() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(100),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 64,
            width: 64,
            child: const Center(
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
          verticalGap(16),
          Text("Not Found!", style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600),),
          verticalGap(8),
          Text("So sorry, the keyword you are looking\nfor doesn't exists",
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(color: AppColors.textSecondaryColor),)
        ],
      ),
    );
  }

  buildMovieItems(Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Movies",
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
            children: List.generate(5, (index) => MovieCard(
                image: getImageUrl("", "media"),
                name: "Demo",
                id:  0, mediaType: "tv")),
          ),
        ),
        verticalGap(32),
      ],
    );
  }

  buildTvItems(Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Tv Shows",
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
            children: List.generate(5, (index) => MovieCard(
                image: getImageUrl("", "media"),
                name: "Demo",
                id:  0, mediaType: "tv")),
          ),
        ),
        verticalGap(32),
      ],
    );
  }

  buildPersonItems(Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "People",
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
            spacing: 16,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 16,
            children: List.generate(5, (index) => SizedBox(
              width: 72,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.network(
                      getImageUrl("", "person"),
                      height: 72,
                      width: 72,
                      fit: BoxFit.cover,
                    ),
                  ),
                  verticalGap(8),
                  Text("User",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik()),
                ],
              ),
            )),
          ),
        ),
        verticalGap(32),
      ],
    );
  }
}

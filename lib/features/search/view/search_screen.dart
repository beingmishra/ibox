import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/helpers/gener_helper.dart';
import 'package:ibox/config/helpers/general_functions.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/config/widgets/movie_card.dart';
import 'package:ibox/features/genre/views/genre_filtered_screen.dart';
import 'package:ibox/features/search/controllers/search_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final controller = Get.put(SearchMediaController());
  final searchController = TextEditingController();
  bool isLoading = false;
  Timer? _debounce;

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
                  controller: searchController,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search here",
                    hintStyle: GoogleFonts.rubik(color: AppColors.textSecondaryColor),
                    suffixIconColor: Theme.of(context).iconTheme.color,
                    suffixIcon: searchController.text.isEmpty ? const Icon(Icons.search) : InkWell(
                        onTap: () {
                          searchController.clear();
                          controller.searchTvResponseModel = null;
                          controller.searchMovieResponse = null;
                          controller.searchPersonResponse = null;
                          setState(() {});
                        },
                        child: const Icon(Icons.close),
                    )
                  ),
                ),
              ),
              verticalGap(32),
              (controller.searchPersonResponse?.results ?? []).isEmpty && (controller.searchMovieResponse?.results ?? []).isEmpty
                  && (controller.searchTvResponseModel?.results ?? []).isEmpty
                  ? buildNoData() : Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(), // placeholder
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

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      fetchData(query);
    });
  }

  buildNoData() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Explore by genre", style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600),),
          verticalGap(16),
          Wrap(
            spacing: 16,
            children: mixGenres.map((data) => InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GenreFilteredScreen(genreData: data))),
                child: Chip(label: Text(data.name)))).toList(),
          )
        ],
      ),
    );
  }

  buildMovieItems(Size size) {
    return (controller.searchMovieResponse?.results ?? []).isEmpty ? const SizedBox() : Column(
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
          padding: EdgeInsets.zero,
          child: Wrap(
            spacing: 12,
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 12,
            children: List.generate(controller.searchMovieResponse!.results.length, (index) => MovieCard(
                image: getImageUrl(controller.searchMovieResponse!.results[index].posterPath, "media"),
                name: controller.searchMovieResponse!.results[index].title,
                id: controller.searchMovieResponse!.results[index].id, mediaType: "movie")),
          ),
        ),
        verticalGap(32),
      ],
    );
  }

  buildTvItems(Size size) {
    return (controller.searchTvResponseModel?.results ?? []).isEmpty ? const SizedBox() : Column(
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
            children: List.generate(controller.searchTvResponseModel!.results.length, (index) => MovieCard(
                image: getImageUrl(controller.searchTvResponseModel!.results[index].posterPath, "media"),
                name: controller.searchTvResponseModel!.results[index].name,
                id: controller.searchTvResponseModel!.results[index].id, mediaType: "tv")),
          ),
        ),
        verticalGap(32),
      ],
    );
  }

  buildPersonItems(Size size) {
    return (controller.searchPersonResponse?.results ?? []).isEmpty ? const SizedBox() : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "People",
          style:
          GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600),
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
            children: List.generate(controller.searchPersonResponse!.results.length, (index) => SizedBox(
              width: 72,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.network(
                      getImageUrl(controller.searchPersonResponse!.results[index].profilePath, "person"),
                      height: 72,
                      width: 72,
                      fit: BoxFit.cover,
                    ),
                  ),
                  verticalGap(8),
                  Text(controller.searchPersonResponse!.results[index].name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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

  Future<void> fetchData(String query) async {

    if(query.isEmpty){
      searchController.clear();
      controller.searchTvResponseModel = null;
      controller.searchMovieResponse = null;
      controller.searchPersonResponse = null;
      setState(() {});
      return;
    }

    setState(() {
      isLoading = true;
    });

    await controller.searchPersons(query);
    await controller.searchMovie(query);
    await controller.searchTv(query);

    setState(() {
      isLoading = false;
    });
  }
}

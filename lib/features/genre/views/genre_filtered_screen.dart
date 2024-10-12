import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/helpers/gener_helper.dart';
import 'package:ibox/config/helpers/general_functions.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/features/detail/views/movie_detail_screen.dart';
import 'package:ibox/features/detail/views/tv_detail_screen.dart';
import 'package:ibox/features/genre/controllers/genre_controller.dart';
import 'package:ibox/features/genre/models/genre_movie_response_model.dart';
import 'package:ibox/features/genre/models/genre_tv_response_model.dart';

class GenreFilteredScreen extends StatefulWidget {
  final MixGenre genreData;
  const GenreFilteredScreen({super.key, required this.genreData});

  @override
  State<GenreFilteredScreen> createState() => _GenreFilteredScreenState();
}

class _GenreFilteredScreenState extends State<GenreFilteredScreen> {
  bool isTv = false;
  ScrollController scrollController = ScrollController();
  final controller = Get.put(GenreController());
  bool isLoading = false;
  bool isPaginating = false;
  bool stopLoading = false;
  int currentPage = 1;
  double boundaryOffset = 0.5;
  List<GenreMovie> movies = [];
  List<GenreTv> tv = [];

  @override
  void initState() {
    super.initState();

    if (widget.genreData.movieId == -1) {
      isTv = true;
    }

    fetchData();

    scrollController.addListener(() {
      if (!stopLoading) {
        //load more data
        if (scrollController.offset >= scrollController.position.maxScrollExtent * boundaryOffset &&
            !isLoading) {
          isPaginating = true;
          callApi().then((shouldStop) {
            isPaginating = false;
            currentPage++;
            boundaryOffset = 1 - 1 / (currentPage * 2);
            if (shouldStop) {
              stopLoading = true;
            }
            setState(() {});
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.genreData.name,
          style: GoogleFonts.rubik(),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Visibility(
                    visible: isTv ? widget.genreData.movieId != -1 : widget.genreData.tvId != -1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.cardDarkColor,
                          borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isTv
                                ? "Looking for Movies?"
                                : "Looking for TV Shows?",
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isTv = !isTv;
                                  currentPage = 1;
                                  boundaryOffset = 0.5;
                                  movies.clear();
                                  tv.clear();
                                  fetchData();
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: const StadiumBorder()),
                              child: Text(
                                "Switch",
                                style: GoogleFonts.rubik(),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        controller: scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 16,
                                childAspectRatio: 1 / 2),
                        itemCount: isTv ? tv.length : movies.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if(isTv){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TvDetailScreen(id: tv[index].id,)));
                              }else{
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(id: movies[index].id,)));
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    getImageUrl(
                                        isTv ? tv[index].posterPath : movies[index].posterPath,
                                        "media"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                verticalGap(8),
                                Text(
                                  isTv ? tv[index].name : movies[index].title,
                                  style: GoogleFonts.rubik(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  if (isPaginating)
                    const LinearProgressIndicator(
                      color: AppColors.primaryColor,
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

    await callApi();

    setState(() {
      isLoading = false;
    });
  }

  Future<bool> callApi() async {
    if (isTv) {
      await controller.fetchGenreTv(currentPage, widget.genreData.tvId);
      if (controller.genreTvShows != null) {
        tv.addAll(controller.genreTvShows!.results);
        if (controller.genreTvShows!.page ==
            controller.genreTvShows!.totalPages) {
          stopLoading = true;
          return true;
        }
      }
    } else {
      await controller.fetchGenreMovies(currentPage, widget.genreData.movieId);
      if (controller.genreMovies != null) {
        movies.addAll(controller.genreMovies!.results);
        if (controller.genreMovies!.page ==
            controller.genreMovies!.totalPages) {
          stopLoading = true;
          return true;
        }
      }
    }

    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/theme/app_colors.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
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
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pharetra nibh eros, at aliquet nisi volutpat vel. Praesent blandit pellentesque gravida. Ut sapien mi, venenatis a imperdiet ut, hendrerit id libero. Fusce non egestas odio. Nulla accumsan accumsan felis, ac tincidunt justo gravida a. Nunc maximus risus eu sodales vulputate. Morbi at dolor commodo, molestie lectus sit amet, scelerisque velit. Morbi ultrices sit amet justo id aliquam. Praesent eleifend lacus vel pellentesque dictum. Nulla purus dolor, facilisis quis congue at, dictum a elit. Aliquam erat volutpat. Pellentesque dui augue, consequat non molestie non, laoreet id dui. Phasellus ligula risus, auctor ut elementum dapibus, mattis id dolor. Cras rhoncus orci malesuada imperdiet ullamcorper. ",
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
                      children: List.generate(5, (index) => SizedBox(
                                width: 64,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQEuinbzGY804xwljtLiC3yIw9YhgqtJCnhhqaPisZNC2buRdgj",
                                        height: 64,
                                        width: 64,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    verticalGap(8),
                                    Text("Sam Worthington",
                                        style: GoogleFonts.rubik(fontSize: 14)),
                                  ],
                                ),
                              )),
                    ),
                  )
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
            "https://m.media-amazon.com/images/S/pv-target-images/f0535dd61f56bddd6ee7f3bfb765645e45d78f373418ae37ee5103cf6eebbff0.jpg",
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
                    "Avatar : The Way of Water",
                    style: GoogleFonts.rubik(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  verticalGap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("2023", style: GoogleFonts.rubik(fontSize: 12)),
                      horizontalGap(8),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      horizontalGap(8),
                      Text("Sci-Fi, Action",
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
                      Text("2h30m", style: GoogleFonts.rubik(fontSize: 12)),
                    ],
                  ),
                  verticalGap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      horizontalGap(4),
                      Text("4.2", style: GoogleFonts.rubik(fontSize: 12)),
                      horizontalGap(4),
                      Text("(128 reviews)",
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
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/config/theme/app_theme.dart';
import 'package:ibox/features/detail/views/movie_detail_screen.dart';

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
              Expanded(
                child: ListView.separated(
                    itemCount: 4,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen()));
                    },
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            "https://m.media-amazon.com/images/S/pv-target-images/f0535dd61f56bddd6ee7f3bfb765645e45d78f373418ae37ee5103cf6eebbff0.jpg",
                            fit: BoxFit.cover,
                            height: 100,
                            width: size.width * 0.25,
                          ),
                        ),
                        horizontalGap(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Text("Movie", style: GoogleFonts.rubik(fontSize: 12),),
                            ),
                            verticalGap(12),
                            Text("Avatar : The Way of Water", style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600),),
                            verticalGap(12),
                            Row(
                                children: [
                                  Text("2023", style: GoogleFonts.rubik(fontSize: 12)),
                                  horizontalGap(8),
                                  Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                  ),
                                  horizontalGap(8),
                                  Text("Sci-Fi, Action", style: GoogleFonts.rubik(fontSize: 12)),
                                  horizontalGap(8),
                                  Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                  ),
                                  horizontalGap(8),
                                  Text("2h30m", style: GoogleFonts.rubik(fontSize: 12)),
                                ])
                          ],
                        )
                      ],
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                      return verticalGap(16);
                },),
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
}

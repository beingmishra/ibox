import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/helpers/gener_helper.dart';
import 'package:ibox/config/helpers/general_functions.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/features/home/models/trending_media_response.dart';
import 'package:ibox/network/url_helper.dart';

class BigSliderCard extends StatelessWidget {
  final TrendingMediaItem data;
  const BigSliderCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    print(data.toJson());
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height * 0.65,
      width: size.width,
      child: Stack(
        children: [
          Image.network(
            getImageUrl(data.posterPath, "media"),
            fit: BoxFit.cover,
            height: size.height * 0.65,
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
                        0.75
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
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(data.mediaType.capitalizeFirst ?? "-", style: GoogleFonts.rubik(fontSize: 12),),
                        ),
                        verticalGap(12),
                        Text(data.title ?? data.name ?? "-", style: GoogleFonts.rubik(fontSize: 28, fontWeight: FontWeight.w600),),
                        verticalGap(12),
                        Row(
                          children: [
                            Text((data.releaseDate?.year ?? data.firstAirDate?.year ?? "-").toString(), style: GoogleFonts.rubik(fontSize: 12)),
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
                            Expanded(child: Text(getGenresByIds(data.genreIds, data.mediaType),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.rubik(fontSize: 12))),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    height: 42,
                    width: 42,
                    child: const Center(child: Icon(Icons.play_arrow_sharp, color: Colors.white, size: 28,),),
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

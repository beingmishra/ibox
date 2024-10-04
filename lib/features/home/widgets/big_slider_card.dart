import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/theme/app_colors.dart';

class BigSliderCard extends StatelessWidget {
  const BigSliderCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height * 0.65,
      width: size.width,
      child: Stack(
        children: [
          Image.network(
            "https://m.media-amazon.com/images/S/pv-target-images/f0535dd61f56bddd6ee7f3bfb765645e45d78f373418ae37ee5103cf6eebbff0.jpg",
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
                          child: Text("Movie", style: GoogleFonts.rubik(fontSize: 12),),
                        ),
                        verticalGap(12),
                        Text("Avatar : The Way of Water", style: GoogleFonts.rubik(fontSize: 28, fontWeight: FontWeight.w600),),
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

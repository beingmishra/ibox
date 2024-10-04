import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/features/detail/views/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen())),
      child: SizedBox(
        width: size.width * 0.3,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://m.media-amazon.com/images/S/pv-target-images/f0535dd61f56bddd6ee7f3bfb765645e45d78f373418ae37ee5103cf6eebbff0.jpg",
                fit: BoxFit.cover,
                height: 180,
                width: size.width * 0.3,
              ),
            ),
            verticalGap(8),
            Text("Avatar : The Way of Water", style: GoogleFonts.rubik())
          ],
        ),
      ),
    );
  }
}

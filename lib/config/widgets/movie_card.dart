import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/features/detail/views/movie_detail_screen.dart';
import 'package:ibox/features/detail/views/tv_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final String image;
  final String name;
  final int id;
  final String mediaType;
  const MovieCard({super.key, required this.image, required this.name, required this.id, required this.mediaType});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => mediaType == "tv" ? TvDetailScreen(id: id) : MovieDetailScreen(id: id,))),
      child: SizedBox(
        width: size.width * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: 180,
                width: size.width * 0.3,
              ),
            ),
            verticalGap(8),
            Text(name, style: GoogleFonts.rubik(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

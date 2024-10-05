import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/theme/app_colors.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(),
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
                Icons.error,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
          verticalGap(16),
          Text("Oops!", style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600),),
          verticalGap(8),
          Text("Seems like there is an error while fetching data,\nPlease try again later",
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(color: AppColors.textSecondaryColor),)
        ],
      ),
    );
  }
}

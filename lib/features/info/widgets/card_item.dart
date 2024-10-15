import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/theme/app_colors.dart';

class CardItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTapEvent;
  const CardItem({super.key, required this.icon, required this.title, required this.onTapEvent});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapEvent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardDarkColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Image.asset(icon, height: 28, width: 28, color: Colors.white,),
            verticalGap(12),
            Text(title, style: GoogleFonts.rubik(),)
          ],
        ),
      ),
    );
  }
}

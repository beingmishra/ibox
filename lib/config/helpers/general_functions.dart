import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/network/url_helper.dart';

String getImageUrl(String? imagePath, String type){
  if(imagePath == null || imagePath == "") {
    if (type == "media") {
      return "https://www.popcorn.app/assets/app/images/placeholder-movieimage.png";
    } else {
      return "https://cdn.vectorstock.com/i/500p/08/19/gray-photo-placeholder-icon-design-ui-vector-35850819.jpg";
    }
  }

  return (UrlHelper.imageUrl + imagePath);
}

void showNoTrailerDialog(BuildContext context) {
  showDialog(context: context, builder: (context) {
    return Dialog(
      backgroundColor: AppColors.cardDarkColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error, color: AppColors.primaryColor, size: 56,),
            verticalGap(12),
            Text("No trailer or teaser found", style: GoogleFonts.rubik(
                fontSize: 18
            ),),
            verticalGap(16),

            ElevatedButton(onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder()
                ),
                child: Text("Close", style: GoogleFonts.rubik(
                    color: Colors.black
                ),))
          ],
        ),
      ),
    );
  });
}
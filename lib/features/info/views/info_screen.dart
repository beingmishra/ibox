import 'package:flutter/material.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/features/info/widgets/card_item.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset("assets/images/ibox_logo.png")),
              verticalGap(16),
              Text("iBox is an open-source app that uses the TMDB API to provide users with detailed information about movies and TV shows. With iBox, you can explore the latest releases, popular titles, and discover trending content. The app offers rich details about each movie or show, including cast information, plot summaries, ratings, and more, all in a clean and user-friendly interface. Built to deliver an engaging and informative experience, iBox is perfect for movie enthusiasts who want easy access to up-to-date entertainment data.",
                style: GoogleFonts.rubik(),
              ),
              verticalGap(16),
              Row(
                children: [
                  Expanded(child: CardItem(icon: "assets/images/github.png", title: "Github", onTapEvent: (){
                    launchUrl(Uri.parse("https://github.com/beingmishra/ibox"));
                  })),
                  horizontalGap(16),
                  Expanded(child: CardItem(icon: "assets/images/web.png", title: "Website", onTapEvent: (){})),
                  horizontalGap(16),
                  Expanded(child: CardItem(icon: "assets/images/telegram.png", title: "Contact", onTapEvent: (){
                    launchUrl(Uri.parse("https://t.me/beingmishra"));
                  })),
                ],
              ),
              verticalGap(16),
              GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse("https://beingmishra.github.io/"));
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.cardDarkColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Image.network("https://avatars.githubusercontent.com/u/40587889?v=4", height: 48, width: 48,),
                      horizontalGap(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Developed by", style: GoogleFonts.rubik(
                            color: AppColors.textSecondaryColor
                          ),),
                          verticalGap(8),
                          Text("Rahul Mishra", style: GoogleFonts.rubik(fontSize: 18),)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

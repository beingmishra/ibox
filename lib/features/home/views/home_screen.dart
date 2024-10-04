import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:ibox/config/widgets/movie_card.dart';
import 'package:ibox/features/home/widgets/big_slider_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
              SizedBox(
                height: size.height * 0.65,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                  return const BigSliderCard();
                }),
              ),
            const Divider(
              indent: 16,
              endIndent: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Most Popular", style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600),),
                      Text("View all", style: GoogleFonts.rubik(fontSize: 14, color: AppColors.hintColor),),
                    ],
                  ),
                  verticalGap(16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 12,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runSpacing: 12,
                      children: List.generate(
                        5, (index) =>  const MovieCard()
                      ),
                    ),
                  ),
                  verticalGap(32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Top Rated", style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w600),),
                      Text("View all", style: GoogleFonts.rubik(fontSize: 14, color: AppColors.hintColor),),
                    ],
                  ),
                  verticalGap(16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 12,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runSpacing: 12,
                      children: List.generate(
                          5, (index) =>  const MovieCard()
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

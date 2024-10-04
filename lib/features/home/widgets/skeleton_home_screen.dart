import 'package:flutter/material.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonHomeScreen extends StatelessWidget {
  const SkeletonHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Skeletonizer.zone(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.65,
                width: size.width,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
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
                                  Bone.text(words: 2),
                                  verticalGap(12),
                                  Bone.text(words: 4),
                                  verticalGap(12),
                                  Row(
                                    children: [
                                      Bone.text(words: 1),
                                      horizontalGap(8),
                                      Bone.circle(size: 6),
                                      horizontalGap(8),
                                      Bone.text(words: 1),
                                      horizontalGap(8),
                                      Bone.circle(size: 6),
                                      horizontalGap(8),
                                      Bone.text(words: 1),
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
                              child: Bone.icon(size: 28,),),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
              ),
              Padding(
                  padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Bone.text(words: 3,),
                      ],
                    ),
                    verticalGap(16),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 180,
                              width: size.width * 0.3,
                            ),
                            Bone.text(words: 3,)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 180,
                              width: size.width * 0.3,
                            ),
                            Bone.text(words: 3,)
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 180,
                              width: size.width * 0.3,
                            ),
                            Bone.text(words: 3,)
                          ],
                        ),
                      ],
                    ),
                    verticalGap(32),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

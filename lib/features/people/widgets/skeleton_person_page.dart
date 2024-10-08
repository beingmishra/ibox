import 'package:flutter/material.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonPersonPage extends StatelessWidget {
  const SkeletonPersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Skeletonizer.zone(child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.45,
            width: size.width,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF3A3A3A),
                      borderRadius: BorderRadius.circular(16)),
                  height: size.height * 0.45,
                  width: size.width,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: size.height * 0.5,
                    width: size.width,
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Bone.icon(
                        size: 145,
                      ),
                      verticalGap(16),
                      const Bone.text(
                        words: 2,
                      ),
                      verticalGap(16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Bone.icon(),
                                horizontalGap(8),
                                const Bone.text(words: 1,),
                              ],
                            ),
                          ),
                          horizontalGap(12),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Bone.icon(),
                                horizontalGap(8),
                                const Bone.text(words: 1,),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Bone.text(words: 1,),
                verticalGap(8),
                const Bone.text(words: 3,),
                verticalGap(8),
                const Bone.text(words: 3,),
                verticalGap(8),
                const Bone.text(words: 3,),
                verticalGap(8),
                const Bone.text(words: 3,),
                verticalGap(24),
                const Bone.text(words: 1, fontSize: 18,),
                verticalGap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Bone.circle(
                          size: 64,
                        ),
                        verticalGap(8),
                        const Bone.text(words: 1,),
                      ],
                    ),
                    Column(
                      children: [
                        const Bone.circle(
                          size: 64,
                        ),
                        verticalGap(8),
                        const Bone.text(words: 1,),
                      ],
                    ),
                    Column(
                      children: [
                        const Bone.circle(
                          size: 64,
                        ),
                        verticalGap(8),
                        const Bone.text(words: 1,),
                      ],
                    ),
                    Column(
                      children: [
                        const Bone.circle(
                          size: 64,
                        ),
                        verticalGap(8),
                        const Bone.text(words: 1,),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )

        ],
      ),
    ));
  }
}

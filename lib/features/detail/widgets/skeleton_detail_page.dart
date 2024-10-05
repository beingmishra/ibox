import 'package:flutter/material.dart';
import 'package:ibox/config/helpers/common_widgets.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonDetailPage extends StatelessWidget {
  const SkeletonDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Skeletonizer.zone(
        child: SingleChildScrollView(
          child: Column(
                children: [
          SizedBox(
            height: size.height * 0.55,
            width: size.width,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF3A3A3A),
                      borderRadius: BorderRadius.circular(16)),
                  height: size.height * 0.55,
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
                          0.7
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Bone.icon(
                          size: 42,
                        ),
                        verticalGap(12),
                        const Bone.text(
                          words: 3,
                        ),
                        verticalGap(12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Bone.text(
                              words: 1,
                              fontSize: 12,
                            ),
                            horizontalGap(8),
                            const Bone.circle(size: 6,),
                            horizontalGap(8),
                            const Bone.text(
                              words: 2,
                              fontSize: 12,
                            ),
                          ],
                        ),
                        verticalGap(12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Bone.icon(size: 20,),
                            horizontalGap(4),
                            const Bone.text(words: 1, fontSize: 12,),
                            horizontalGap(4),
                            const Bone.text(words: 1, fontSize: 12,),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(),
                const Bone.text(words: 1, fontSize: 18,),
                verticalGap(8),
                const Bone.text(words: 8,),
                verticalGap(4),
                const Bone.text(words: 8,),
                verticalGap(4),
                const Bone.text(words: 8,),
                verticalGap(4),
                const Bone.text(words: 8,),
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
                verticalGap(24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Bone.text(words: 3,),
                  ],
                ),
                verticalGap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF3A3A3A),
                              borderRadius: BorderRadius.circular(16)
                          ),
                          height: 180,
                          width: size.width * 0.28,
                        ),
                        const Bone.text(words: 1,)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF3A3A3A),
                              borderRadius: BorderRadius.circular(16)
                          ),
                          height: 180,
                          width: size.width * 0.28,
                        ),
                        const Bone.text(words: 1,)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF3A3A3A),
                              borderRadius: BorderRadius.circular(16)
                          ),
                          height: 180,
                          width: size.width * 0.28,
                        ),
                        const Bone.text(words: 1,)
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

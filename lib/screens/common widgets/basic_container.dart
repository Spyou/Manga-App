import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../data/manga.dart';

class AllManga extends StatelessWidget {
  const AllManga({super.key});

  @override
  Widget build(BuildContext context) {
    List<MangaModel> poPular = List.of(popular);
    return AnimationLimiter(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 170,
                  crossAxisCount: 3,
                ),
                itemCount: popular.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: 3,
                    child: SlideAnimation(
                      horizontalOffset: 50.0,
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Stack(
                          children: [
                            Container(
                              height: 160,
                              width: 115,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      poPular[index].imageAsset.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 5),
                              child: Container(
                                height: 20,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 53, 53, 53),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star_rounded,
                                      color: Colors.yellow,
                                      size: 12,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      poPular[index].rating.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                child: Container(
                                  height: 30,
                                  width: 115,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 53, 53, 53),
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(10),
                                      )),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        poPular[index].title.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            // GridView.builder(
            //     shrinkWrap: true,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       mainAxisExtent: 325,
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 13,
            //     ),
            //     itemCount: popular.length,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemBuilder: (context, index) {
            //       return AnimationConfiguration.staggeredGrid(
            //         position: index,
            //         duration: const Duration(milliseconds: 375),
            //         columnCount: 2,
            //         child: ScaleAnimation(
            //           child: FadeInAnimation(
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Container(
            //                   width: 180,
            //                   height: 240,
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(20),
            //                       image: DecorationImage(
            //                           image: NetworkImage(
            //                               poPular[index].imageAsset.toString()),
            //                           fit: BoxFit.cover)),
            //                 ),
            //                 const SizedBox(
            //                   height: 10,
            //                 ),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       popular[index].title.toString(),
            //                       style: const TextStyle(color: Colors.white),
            //                     ),
            //                     const SizedBox(
            //                       height: 3,
            //                     ),
            //                     Text(
            //                       popular[index].released.toString(),
            //                       style: TextStyle(color: Colors.grey[400]),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:manga_app/data/manga.dart';
import 'package:manga_app/utils/ui/colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  List<MangaModel> genreTop = List.of(genre);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.offset > 100) {
        print('Scrolled');
      }
    });

    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    centerTitle: false,
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    foregroundColor: AppColor.primaryColor,
                    leadingWidth: 100,
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new_rounded,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Back',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
            body: ListView(
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    'Genres',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 125,
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: genreTop.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ZoomTapAnimation(
                          child: Container(
                            width: 175,
                            height: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                opacity: 0.5,
                                image: AssetImage(
                                    genreTop[index].imageAsset.toString()),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    genreTop[index].title.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            )));
  }
}

  // Widget allManga() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
  //     child: Stack(
  //       children: [
  //         GridView.builder(
  //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //               mainAxisExtent: 300,
  //               crossAxisCount: 2,
  //               crossAxisSpacing: 13,
  //             ),
  //             itemCount: 20,
  //             physics: const BouncingScrollPhysics(),
  //             itemBuilder: (context, index) {
  //               return Column(
  //                 children: [
  //                   ZoomTapAnimation(
  //                     child: Container(
  //                       width: 180,
  //                       height: 240,
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(20),
  //                           image: const DecorationImage(
  //                               image: NetworkImage(
  //                                   "https://m.media-amazon.com/images/I/81KVomnzLmL.jpg"),
  //                               fit: BoxFit.cover)),
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 10,
  //                   ),
  //                   const Text(
  //                     'Chainsaw Man',
  //                     style: TextStyle(color: Colors.white),
  //                   ),
  //                 ],
  //               );
  //             })
  //       ],
  //     ),
  //   );
  // }

//   Widget genres(List<MangaModel> mangaList) {
//     return Container(
//       padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
//       child: ListView.builder(
//           itemCount: genreTop.length,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return Stack(
//               children: [
//                 ZoomTapAnimation(
//                   child: Container(
//                     height: 170,
//                     width: 370,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       image: DecorationImage(
//                         image:
//                             AssetImage(mangaList[index].imageAsset.toString()),
//                         colorFilter: ColorFilter.mode(
//                             Colors.black.withOpacity(0.30), BlendMode.darken),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     margin: const EdgeInsets.only(
//                       left: 15,
//                       right: 15,
//                       top: 0,
//                       bottom: 25,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 80),
//                   child: Center(
//                     child: Text(
//                       mangaList[index].title.toString(),
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25),
//                     ),
//                   ),
//                 )
//               ],
//             );
//           }),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:sliding_navbar/data/manga.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  List<MangaModel> genreTop = List.of(genre);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          expandedHeight: 70,
          foregroundColor: Colors.white,
          flexibleSpace: const FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.all(10),
            title: Text(
              'Genres',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
        ),
      ],
      body: Container(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
        child: ListView.builder(
            itemCount: genreTop.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  ZoomTapAnimation(
                    child: Container(
                      height: 170,
                      width: 370,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image:
                              AssetImage(genreTop[index].imageAsset.toString()),
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.30), BlendMode.darken),
                          fit: BoxFit.cover,
                        ),
                      ),
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 0,
                        bottom: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Center(
                      child: Text(
                        genreTop[index].title.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    ));
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
}

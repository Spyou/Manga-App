// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sliding_navbar/data/manga.dart';

// ignore: must_be_immutable
class CustomBox extends StatelessWidget {
  MangaModel mangaModel;
  CustomBox({
    Key? key,
    required this.mangaModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 7),
          height: 210,
          width: 155,
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black26.withOpacity(0.1),
            Colors.transparent,
          ])),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(mangaModel.imageAsset!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            left: 15,
            right: 15,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mangaModel.title.toString(),
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Text(
                      mangaModel.released.toString(),
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}


// Positioned(
//             left: 15,
//             right: 15,
//             bottom: 0,
//             top: 200,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   mangaModel.title.toString(),
//                   maxLines: 2,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       mangaModel.released.toString(),
//                       style: TextStyle(color: Colors.white),
//                       maxLines: 1,
//                     )
//                   ],
//                 )
//               ],
//             ))
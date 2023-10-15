// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBox extends StatelessWidget {
  String imageAsset;
  String chapters;
  String mangaName;
  CustomBox({
    Key? key,
    required this.imageAsset,
    required this.chapters,
    required this.mangaName,
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
              image: NetworkImage(imageAsset),
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
                  mangaName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
                      chapters,
                      style: const TextStyle(color: Colors.white),
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

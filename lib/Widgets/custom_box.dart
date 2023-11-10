// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBox extends StatelessWidget {
  String imageAsset;
  String chapters;
  String mangaName;
  String rating;
  CustomBox({
    Key? key,
    required this.imageAsset,
    required this.chapters,
    required this.mangaName,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 7),
          height: 190,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(imageAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                  rating,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                height: 30,
                width: 130,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 53, 53, 53),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    )),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      mangaName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

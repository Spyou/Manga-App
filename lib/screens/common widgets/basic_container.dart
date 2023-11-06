import 'package:flutter/material.dart';
import 'package:sliding_navbar/data/manga.dart';

class AllManga extends StatelessWidget {
  const AllManga({super.key});

  @override
  Widget build(BuildContext context) {
    List<MangaModel> poPular = List.of(popular);
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
      child: Stack(
        children: [
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 325,
                crossAxisCount: 2,
                crossAxisSpacing: 13,
              ),
              itemCount: popular.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 180,
                      height: 240,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(
                                  poPular[index].imageAsset.toString()),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popular[index].title.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          popular[index].released.toString(),
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../data/manga.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<MangaModel> poPular = List.of(popular);
    // final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                      backgroundColor: Colors.transparent,
                      expandedHeight: 100,
                      flexibleSpace: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search_rounded)),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ZoomTapAnimation(
                                onTap: () {
                                  VxToast.show(context, msg: 'Filter');
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:
                                        const Color.fromARGB(253, 255, 213, 0),
                                  ),
                                  child: const Icon(
                                    FluentIcons.options_16_filled,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 231, 231, 231),
                            hintText: 'Search Manga',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 50),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      )),
                ],
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Search Results : ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                            image: NetworkImage(poPular[index]
                                                .imageAsset
                                                .toString()),
                                            fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        popular[index].title.toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        popular[index].released.toString(),
                                        style:
                                            TextStyle(color: Colors.grey[400]),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

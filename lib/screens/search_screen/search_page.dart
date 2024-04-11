import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../data/manga.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<MangaModel> recent = List.of(recently);
    // final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    expandedHeight: 100,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search_rounded)),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ZoomTapAnimation(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color.fromARGB(253, 255, 213, 0),
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
                    ),
                  ),
                ],
            body: AnimationLimiter(
              child: SingleChildScrollView(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: SizedBox(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
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
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    recent[index]
                                                        .imageAsset
                                                        .toString()),
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
                                                color: const Color.fromARGB(
                                                    255, 53, 53, 53),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                    recent[index]
                                                        .rating
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                                    color: Color.fromARGB(
                                                        255, 53, 53, 53),
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(10),
                                                    )),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: Text(
                                                      recent[index]
                                                          .title
                                                          .toString(),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

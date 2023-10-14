import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sliding_navbar/data/manga.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> with SingleTickerProviderStateMixin {
  List<MangaModel> genreTop = List.of(genre);
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'KBOT09 List',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              text: const TextSpan(children: [
                TextSpan(
                    text: 'Chapters Read  ',
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                TextSpan(
                    text: '1069', style: TextStyle(fontWeight: FontWeight.w600))
              ]),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FluentIcons.arrow_sort_20_filled,
                color: Colors.white,
              )),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TabBar(
            isScrollable: true,
            splashFactory: NoSplash.splashFactory,
            dividerColor: Colors.transparent,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'WATCHLIST (14)',
              ),
              Tab(
                text: 'COMPLETED (10)',
              ),
              Tab(
                text: 'FAVOURITES (2)',
              ),
              Tab(
                text: 'PLANNING (4)',
              ),
              Tab(
                text: 'PAUSED (5)',
              ),
              Tab(
                text: 'DROPPED (0)',
              ),
              Tab(
                text: 'ALL (100)',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                allManga(),
                genres(genre),
                allManga(),
                genres(genre),
                allManga(),
                genres(genre),
                allManga(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget allManga() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Stack(
        children: [
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 300,
                crossAxisCount: 2,
                crossAxisSpacing: 13,
              ),
              itemCount: 20,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ZoomTapAnimation(
                      child: Container(
                        width: 180,
                        height: 240,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://m.media-amazon.com/images/I/81KVomnzLmL.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Chainsaw Man',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }

  Widget genres(List<MangaModel> mangaList) {
    return Container(
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
                            AssetImage(mangaList[index].imageAsset.toString()),
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
                      mangaList[index].genreName.toString(),
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
    );
  }
}

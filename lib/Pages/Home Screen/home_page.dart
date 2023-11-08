import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:manga_app/data/manga.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../Widgets/custom_box.dart';
import '../Detail Screen/screens/detail.page.dart';
import 'widgets/genre.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<MangaModel> banner = List.of(trending);
    List<MangaModel> recent = List.of(recently);
    List<MangaModel> poPular = List.of(popular);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(255, 69, 69, 69),
                ),
                child: IconButton(
                    onPressed: () {
                      VxToast.show(
                        context,
                        msg: 'List Updated',
                        bgColor: const Color.fromARGB(255, 209, 209, 209),
                      );
                    },
                    icon: const Icon(
                      Icons.bookmark_border_rounded,
                      color: Colors.white,
                    ))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Banner
            CarouselSlider.builder(
              itemCount: banner.length,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                viewportFraction: 1,
                height: size.height * .60,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              ),
              itemBuilder: (context, index, realIndex) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage(banner[index].imageAsset.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: size.height / 3.0,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 18, 18, 18),
                              Colors.transparent
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Column(
                        children: [
                          Text(
                            banner[index].title.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            banner[index].year.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration:
                                          const Duration(milliseconds: 700),
                                      child: const DetailPage()));
                                },
                                child: Container(
                                  height: 45,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromARGB(253, 255, 213, 0),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.play_arrow_rounded),
                                      Text(
                                        'Watch Now',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            //Banner Indicator
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: banner.length,
              effect: const WormEffect(
                  spacing: 8,
                  dotWidth: 10,
                  dotHeight: 10,
                  activeDotColor: Colors.white,
                  dotColor: Color.fromARGB(255, 69, 69, 69)),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                // Box [Top Charts, Genres]
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ZoomTapAnimation(
                      onTap: () {
                        VxToast.show(context,
                            msg: 'Coming Soon',
                            bgColor: const Color.fromARGB(255, 209, 209, 209));
                      },
                      child: Container(
                        width: 160,
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromARGB(255, 73, 73, 73))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              FluentIcons.data_trending_20_filled,
                              color: Color.fromARGB(253, 255, 213, 0),
                            ),
                            Text(
                              'Top Charts',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BrowsePage()));
                      },
                      child: Container(
                        width: 150,
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromARGB(255, 73, 73, 73))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              FluentIcons.grid_20_filled,
                              color: Color.fromARGB(253, 255, 213, 0),
                            ),
                            Text(
                              'Genres',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  // Box [Schedule, Random]
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ZoomTapAnimation(
                      onTap: () {
                        VxToast.show(context,
                            msg: 'Coming Soon',
                            bgColor: Color.fromARGB(255, 209, 209, 209));
                      },
                      child: Container(
                        width: 160,
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromARGB(255, 73, 73, 73))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              FluentIcons.calendar_20_filled,
                              color: Color.fromARGB(253, 255, 213, 0),
                            ),
                            Text(
                              'Schedule',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ZoomTapAnimation(
                      onTap: () {
                        VxToast.show(context,
                            msg: 'Coming Soon',
                            bgColor: const Color.fromARGB(255, 209, 209, 209));
                      },
                      child: Container(
                        width: 150,
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromARGB(255, 73, 73, 73))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              FluentIcons.arrow_shuffle_20_filled,
                              color: Color.fromARGB(253, 255, 213, 0),
                            ),
                            Text(
                              'Random',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            // Recently Released
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recently",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            recentListBuilder(recent),
            // Popular Manga
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            popularListBuilder(poPular),
          ],
        ),
      ),
    );
  }

  // RecentLy List

  Widget recentListBuilder(List<MangaModel> recentList) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailPage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: MediaQuery.of(context).size.height * 0.31,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recentList.length,
          itemBuilder: (context, index) {
            return CustomBox(
              imageAsset: recentList[index].imageAsset.toString(),
              mangaName: recentList[index].title.toString(),
              chapters: recentList[index].released.toString(),
            );
          },
        ),
      ),
    );
  }

  // Popular List

  Widget popularListBuilder(List<MangaModel> popularList) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailPage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: MediaQuery.of(context).size.height * 0.31,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularList.length,
          itemBuilder: (context, index) {
            return CustomBox(
              imageAsset: popularList[index].imageAsset.toString(),
              mangaName: popularList[index].title.toString(),
              chapters: popularList[index].released.toString(),
            );
          },
        ),
      ),
    );
  }
}

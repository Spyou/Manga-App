import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:manga_app/Widgets/custom_box.dart';
import 'package:manga_app/blocs/home_bloc/home_bloc.dart';
import 'package:manga_app/model/banner_model.dart';
import 'package:manga_app/utils/ui/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../model/anime_item_model.dart';
import '../detail_screen/screens/detail.page.dart';
import 'widgets/genre.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;
  List<BannerData> bannerList = [];
  var activeIndex = -1;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(OnInitHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        if (state is Loading) {
          isLoading = true;
        }
      }, builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: SpinKitSpinningLines(
              color: AppColor.primaryColor,
            ),
          );
        } else if (state is HomeFetchResult) {
          return Builder(builder: (context) {
            var bannerList = state.bannerList;
            return AnimationLimiter(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Banner
                    CarouselSlider.builder(
                      itemCount: 4,
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
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          columnCount: 1,
                          child: SlideAnimation(
                            horizontalOffset: 150.0,
                            child: Stack(
                              children: [
                                FadeInAnimation(
                                  child: Container(
                                    height: size.height / .60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) {
                                          return const Center(
                                            child: SpinKitSpinningLines(
                                              color: AppColor.primaryColor,
                                            ),
                                          );
                                        },
                                        errorWidget: (context, url, error) {
                                          return Container(
                                            height: size.height / .60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  bannerList[index]
                                                      .coverImage!
                                                      .extraLarge
                                                      .toString(),
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                        imageUrl: bannerList[index]
                                            .bannerImage
                                            .toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 180,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl: bannerList[index]
                                                  .coverImage!
                                                  .large
                                                  .toString(),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                                        bannerList[index]
                                            .title!
                                            .english
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        bannerList[index].genres.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  PageTransition(
                                                      type: PageTransitionType
                                                          .rightToLeftWithFade,
                                                      duration: const Duration(
                                                          milliseconds: 700),
                                                      child:
                                                          const DetailPage()));
                                            },
                                            child: Container(
                                              height: 45,
                                              width: 180,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColor.primaryColor,
                                              ),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                      Icons.play_arrow_rounded),
                                                  Text(
                                                    'Read Now',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                Positioned(
                                  right: 20,
                                  top: 30,
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color.fromARGB(
                                            255, 69, 69, 69),
                                      ),
                                      child: IconButton(
                                          onPressed: () {
                                            VxToast.show(
                                              context,
                                              msg: 'List Updated',
                                              bgColor: const Color.fromARGB(
                                                  255, 209, 209, 209),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.bookmark_border_rounded,
                                            color: Colors.white,
                                          ))),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //Banner Indicator
                    AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: 4,
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
                                    bgColor: const Color.fromARGB(
                                        255, 209, 209, 209));
                              },
                              child: Container(
                                width: 160,
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 73, 73, 73))),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      FluentIcons.data_trending_20_filled,
                                      color: AppColor.primaryColor,
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
                                        builder: (context) =>
                                            const BrowsePage()));
                              },
                              child: Container(
                                width: 150,
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 73, 73, 73))),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      FluentIcons.grid_20_filled,
                                      color: AppColor.primaryColor,
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
                                    bgColor: const Color.fromARGB(
                                        255, 209, 209, 209));
                              },
                              child: Container(
                                width: 160,
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 73, 73, 73))),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      FluentIcons.calendar_20_filled,
                                      color: AppColor.primaryColor,
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
                                    bgColor: const Color.fromARGB(
                                        255, 209, 209, 209));
                              },
                              child: Container(
                                width: 150,
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 15),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 73, 73, 73))),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      FluentIcons.arrow_shuffle_20_filled,
                                      color: AppColor.primaryColor,
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
                            "Recently Added",
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
                    recentListBuilder(state.recentlyList),
                    // Popular Manga
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending",
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
                    trendingListBuilder(state.trendingList),
                  ],
                ),
              ),
            );
          });
        } else if (state is ErrorLoad) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
// HomePage  int activeIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     List<MangaModel> banner = List.of(trending);
//     List<MangaModel> recent = List.of(recently);
//     List<MangaModel> poPular = List.of(popular);
//     final size = MediaQuery.sizeOf(context);
//     return Scaffold(

// body:
//     );
//   }
//
  // RecentLy List

  Widget recentListBuilder(List<AnimeSmallModel> recentList) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailPage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: MediaQuery.of(context).size.height * 0.22,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recentList.length,
          itemBuilder: (context, index) {
            return CustomBox(
              imageAsset: recentList[index].coverImage!.extraLarge.toString(),
              mangaName: recentList[index].title!.english.toString(),
              rating: index.toString(),
            );
          },
        ),
      ),
    );
  }

//   // Popular List
//
  Widget trendingListBuilder(List<AnimeSmallModel> popularList) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailPage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: MediaQuery.of(context).size.height * 0.22,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popularList.length,
          itemBuilder: (context, index) {
            return CustomBox(
              imageAsset: popularList[index].coverImage!.extraLarge.toString(),
              mangaName: popularList[index].title!.english.toString(),
              rating: index.toString(),
            );
          },
        ),
      ),
    );
  }
}

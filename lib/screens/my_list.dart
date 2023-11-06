import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sliding_navbar/data/manga.dart';
import 'package:velocity_x/velocity_x.dart';

import 'common widgets/basic_container.dart';

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
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
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
                          text: '1069',
                          style: TextStyle(fontWeight: FontWeight.w600))
                    ]),
                  )
                ],
              ),
              actions: [
                PopupMenuButton(
                  color: const Color.fromARGB(255, 35, 35, 35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tooltip: 'Sorting',
                  icon: const Icon(
                    FluentIcons.arrow_sort_20_filled,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        VxToast.show(context, msg: 'Sort Updating To Score');
                      },
                      child: const Text(
                        'Sort by Score',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        VxToast.show(context, msg: 'Sort Updating To Title');
                      },
                      child: const Text(
                        'Sort by Title',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        VxToast.show(context,
                            msg: 'Sort Updating To Realease Date');
                      },
                      child: const Text(
                        'Sort by Realease Date',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        VxToast.show(context,
                            msg: 'Sort Updating To Last Updated');
                      },
                      child: const Text(
                        'Sort by Last Updated',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
          body: Column(
            children: [
              TabBar(
                isScrollable: true,
                splashBorderRadius: BorderRadius.circular(50),
                splashFactory: NoSplash.splashFactory,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: 'READING (14)',
                  ),
                  Tab(
                    text: 'RE-READING (14)',
                  ),
                  Tab(
                    text: 'COMPLETED (14)',
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
                  children: const [
                    AllManga(),
                    AllManga(),
                    AllManga(),
                    AllManga(),
                    AllManga(),
                    AllManga(),
                    AllManga(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

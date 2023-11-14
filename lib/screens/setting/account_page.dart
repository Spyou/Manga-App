import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:manga_app/generated/assets.dart';
import 'package:manga_app/screens/setting/listtile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(slivers: [
        const SliverAppBar(
          centerTitle: false,
          pinned: false,
          backgroundColor: Colors.transparent,
          title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Account',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white),
              )),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          width: size.width * .92,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Color.fromARGB(75, 0, 0, 0),
                                    BlendMode.darken),
                                image: AssetImage(Assets.assetsGenreImage1),
                                fit: BoxFit.cover,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: const CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 48,
                                      backgroundImage: AssetImage(
                                        Assets.assetsGenreImage2,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'KBOT09',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 25,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        'newemail69@gmail.com',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 13,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.navigate_next_rounded,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Settings',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ExpansionListTile(),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}

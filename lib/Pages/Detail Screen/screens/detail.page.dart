import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:sliding_navbar/Pages/Detail%20Screen/Widgets/more_bottom_sheet.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/manga.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<MangaModel> banner = List.of(trending);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          IconButton(
            icon: const Icon(
              FluentIcons.bookmark_20_regular,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              FluentIcons.more_vertical_20_regular,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          //Banner
          detailBanner(context, banner),
          //Detail Box
          DetailBox(size: size),
          //BottomSheet
          bottomSheetMore(context),
          //Unfinished Part
          Positioned(
            top: MediaQuery.of(context).size.height * .55,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Chapters',
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Banner
  Column detailBanner(BuildContext context, List<MangaModel> banner) {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * .40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 80,
                image: AssetImage(
                  banner[0].imageAsset.toString(),
                ),
                fit: BoxFit.cover,
              ),
            )),
      ],
    );
  }

  //BottomSheet
  Positioned bottomSheetMore(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .47,
      left: MediaQuery.of(context).size.width * .42,
      child: ZoomTapAnimation(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: const Color.fromARGB(255, 62, 62, 62),
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              isScrollControlled: true,
              builder: (context) => DraggableScrollableSheet(
                  initialChildSize: 0.4,
                  maxChildSize: 0.65,
                  minChildSize: 0.32,
                  expand: false,
                  builder: (context, scrollctrl) {
                    return SingleChildScrollView(
                      controller: scrollctrl,
                      child: const MoreBottomSheet(),
                    );
                  }));
        },
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 46, 46, 46),
          ),
          padding: const EdgeInsets.all(5),
          child: const Icon(
            Icons.keyboard_arrow_up_rounded,
            size: 40,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}

//Detail Box
class DetailBox extends StatelessWidget {
  const DetailBox({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .28,
          right: 20.0,
          left: 20.0),
      child: SizedBox(
        height: 200,
        width: size.width,
        child: Card(
          color: const Color.fromARGB(255, 32, 32, 32),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          elevation: 4.0,
          child: const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'One Piece',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          '9.9',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Chapters : 1079 / ??',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Overview',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'The series focuses on Monkey D. Luffy—a young man made of rubber after unintentionally eating a Devil Fruit — who sets off on a journey from the...',
                  style: TextStyle(
                    color: Color.fromARGB(255, 220, 220, 220),
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

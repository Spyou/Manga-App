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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //Banner
            Column(
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
            ),
            //Detail Box
            DetailBox(size: size),
            //Unfinished Part
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 400, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 60, bottom: 30),
                      child: Text(
                        'Chapters',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 9000,
                      width: size.width,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(top: 0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 400,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(255, 35, 35, 35)),
                              margin: const EdgeInsets.only(bottom: 20),
                              child: ListTile(
                                title: Text(
                                  'Chapter : ${index + 1}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                subtitle: const Text(
                                  'Romance Down',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 136, 136, 136),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  //Banner
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
    return ZoomTapAnimation(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: const Color.fromARGB(255, 34, 34, 34),
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            elevation: 4.0,
            child: const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
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
                      color: Color.fromARGB(255, 209, 209, 209),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Overview',
                    style: TextStyle(
                      color: Color.fromARGB(255, 220, 220, 220),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'The series focuses on Monkey D. Luffy—a young man made of rubber after unintentionally eating a Devil Fruit — who sets off on a journey from the KBOT09 BOT',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
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
      ),
    );
  }
}

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:manga_app/screens/detail_screen/Widgets/more_bottom_sheet.dart';
import 'package:manga_app/utils/ui/colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../data/manga.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<MangaModel> banner = List.of(trending);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
          pinned: true,
          expandedHeight: 400,
          backgroundColor: AppColor.backgroundColor,
          foregroundColor: Colors.white,
          scrolledUnderElevation: 0,
          elevation: 0,
          centerTitle: false,
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
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            // title: const Text(
            //   'One Piece',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 22.0,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
            background: ClipRRect(
                child: Stack(
              children: [
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
                DetailBox(size: size),
              ],
            )),
          )),
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 30, left: 15, top: 20),
              child: Text(
                'Chapters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
          ],
        ),
      ),
    ]));
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

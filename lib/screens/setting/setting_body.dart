import 'package:flutter/material.dart';
import 'package:manga_app/generated/assets.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          height: size.height * 0.4,
          child: Stack(children: [
            Container(
              height: size.height * 0.4 - 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Assets.assetsGenreImage1),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 5,
                child: Container(
                  width: size.width * .22,
                  height: 85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Assets.assetsGenreImage2),
                    ),
                  ),
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    width: size.width * 0.7,
                    height: 85,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 39, 39, 39),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 50,
                            color: const Color.fromARGB(255, 39, 39, 39)
                                .withOpacity(0.2),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(children: [
                        const Expanded(
                            child: Text(
                          "KBOT09",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 22),
                        )),
                        VerticalDivider(
                          width: 23,
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_rounded,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                                const Text(
                                  'Favourites',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.output_rounded,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                                Text(
                                  'Log Out',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ]),
                    )))
          ]),
        ),
      ],
    );
  }
}

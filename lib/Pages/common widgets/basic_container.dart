import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AllManga extends StatelessWidget {
  const AllManga({super.key});

  @override
  Widget build(BuildContext context) {
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
}

import 'package:flutter/material.dart';
import 'package:manga_app/utils/ui/colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FourBox extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData icon;

  const FourBox(
      {super.key,
      required this.onPress,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onPress,
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 73, 73, 73))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: AppColor.primaryColor,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

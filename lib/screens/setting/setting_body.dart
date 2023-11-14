import 'package:flutter/material.dart';
import 'package:manga_app/generated/assets.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 200,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(Assets.assetsGenreImage1),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

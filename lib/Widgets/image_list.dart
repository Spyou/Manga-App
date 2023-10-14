import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  final String label;
  final List<dynamic> imageList;
  const ImageList({
    super.key,
    required this.label,
    required this.imageList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 165,
          child: ListView.builder(
            itemCount: imageList.length,
            padding: const EdgeInsets.only(top: 20, left: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String image = imageList[index];
              return Container(
                margin: const EdgeInsets.only(right: 10),
                height: 150,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    )),
              );
            },
          ),
        )
      ],
    );
  }
}

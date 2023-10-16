import 'package:flutter/material.dart';

class MoreBottomSheet extends StatelessWidget {
  const MoreBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          height: 5,
          width: size.width * .15,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://i.pinimg.com/originals/44/a6/8f/44a68f2ebc9a5373de2724f9620d04f7.png'),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'One piece',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Chapter : 1079 / ??',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Ratings : ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 22,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '9.9',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Chip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                              padding: const EdgeInsets.all(7),
                              backgroundColor:
                                  const Color.fromARGB(255, 54, 54, 54),
                              label: const Text(
                                'Action',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Chip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                              padding: const EdgeInsets.all(7),
                              backgroundColor:
                                  const Color.fromARGB(255, 54, 54, 54),
                              label: const Text(
                                'Adventure',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'ONE PIECE is a legendary high-seas quest unlike any other. Luffy is a young adventurer who has longed for a life of freedom ever since he can remember. He sets off from his small village on a perilous journey to find the legendary fabled treasure, ONE PIECE, to become King of the Pirates!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 220, 220, 220),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

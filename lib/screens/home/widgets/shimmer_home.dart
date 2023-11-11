// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';

// class ShimmerHome extends StatelessWidget {
//   const ShimmerHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     return VxShimmer(
//       duration: Duration(
//         seconds: 2,
//       ),
//       // secondaryColor: const Color.fromARGB(252, 255, 234, 127),
//       // gradient: LinearGradient(
//       //   colors: [
//       //     Color.fromARGB(253, 255, 213, 0),
//       //     Color.fromARGB(255, 193, 193, 193),
//       //     Color.fromARGB(255, 93, 93, 93)
//       //   ],
//       // ),
//       child: Column(
//         children: [
//           Container(
//             height: size.height * .60,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.grey,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Container(
//             height: 20,
//             width: 70,
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 53, 53, 53),
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Column(
//             children: [
//               // Box [Top Charts, Genres]
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     height: 45,
//                     width: 160,
//                     margin: const EdgeInsets.only(left: 20, top: 15),
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   Container(
//                     height: 45,
//                     width: 160,
//                     margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
//                     padding: const EdgeInsets.all(10.0),
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 // Box [Schedule, Random]
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     height: 45,
//                     width: 160,
//                     margin: const EdgeInsets.only(left: 20, top: 15),
//                     padding: const EdgeInsets.all(10.0),
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   Container(
//                     height: 45,
//                     width: 160,
//                     margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
//                     padding: const EdgeInsets.all(10.0),
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 30),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: 20,
//                   width: 140,
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 53, 53, 53),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 Container(
//                   height: 20,
//                   width: 70,
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 53, 53, 53),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

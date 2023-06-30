// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:murphys_technology/screens/homepage/widget/list.dart';
// import 'package:murphys_technology/screens/login.dart';
// import 'package:murphys_technology/utils/device_size.dart';

// class Page extends StatelessWidget {
//   const Page({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: getDeviceWidth(context),
//       child: Drawer(
//         child: SafeArea(
//           child: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color(0xff2B2A7C),
//                   Color(0xffC58FC4),
//                 ],
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 20,
//                 horizontal: 20,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             GestureDetector(
//                               onTap: () => Navigator.pop(context),
//                               child: Icon(
//                                 Icons.arrow_back,
//                                 color: Colors.white.withOpacity(0.8),
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Text(
//                                       "Murphys technology",
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w500,
//                                         fontFamily: "Poppins",
//                                         color: Colors.white.withOpacity(0.9),
//                                       ),
//                                     ),
//                                     Text(
//                                       "Ekantakuna",
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w500,
//                                         fontFamily: "Poppins",
//                                         color: Colors.white.withOpacity(0.9),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Container(
//                                   height: 45,
//                                   width: 45,
//                                   decoration: BoxDecoration(
//                                     image: const DecorationImage(
//                                       image: NetworkImage(
//                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/678px-Elon_Musk_Royal_Society_%28crop2%29.jpg",
//                                       ),
//                                       fit: BoxFit.cover,
//                                     ),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: getDeviceHeight(context) * 0.05,
//                         ),
//                         GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: list("Home", CupertinoIcons.home)),
//                         list("Profile", Icons.person),
//                         list("About us", Icons.album_outlined),
//                         list("Plans", Icons.attach_money_outlined),
//                         list("Contact us", Icons.contact_page),
//                         SizedBox(
//                           height: getDeviceHeight(context) * 0.05,
//                         ),
//                         Container(
//                           height: 180,
//                           width: getDeviceWidth(context),
//                           decoration: BoxDecoration(
//                             color: Colors.grey,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                           onTap: () => showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                               title: const Text("Do you want to logout?"),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                   child: const Text("No"),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).push(
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             const LoginScreen(),
//                                       ),
//                                     );
//                                   },
//                                   child: const Text("Yes"),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.logout,
//                                 color: Colors.white.withOpacity(0.8),
//                               ),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 "Log out",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white.withOpacity(0.8),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

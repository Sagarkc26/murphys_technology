// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:murphys_technology/screens/homepage/homepage.dart';
// // import 'package:murphys_technology/screens/pricing/pricing.dart';

// // class BottomNavBar extends StatefulWidget {
// //   const BottomNavBar({super.key});

// //   @override
// //   State<BottomNavBar> createState() => _BottomNavBarState();
// // }

// // class _BottomNavBarState extends State<BottomNavBar> {
// //   final _pageViewController = PageController();
// //   int _activePage = 0;

// //   static final List<Widget> _widgetOptions = <Widget>[
// //     const HomePage(),
// //     const PricingPage(),
// //     const HomePage(),
// //   ];

// //   @override
// //   void dispose() {
// //     _pageViewController.dispose();
// //     super.dispose();
// //   }

// //   static const List<IconData> _activeIcons = [
// //     Icons.home,
// //     CupertinoIcons.money_dollar_circle,
// //     CupertinoIcons.person_fill,
// //   ];
// //   static const List<IconData> _inactiveIcons = [
// //     Icons.home_outlined,
// //     CupertinoIcons.money_dollar,
// //     CupertinoIcons.person,
// //   ];
// //   static const List<String> _label = [
// //     "Home",
// //     "Pricing",
// //     "Profile",
// //   ];
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: PageView(
// //         controller: _pageViewController,
// //         children: _widgetOptions,
// //         onPageChanged: (index) {
// //           setState(() {
// //             _activePage = index;
// //           });
// //         },
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         type: BottomNavigationBarType.fixed,
// //         showSelectedLabels: false,
// //         showUnselectedLabels: false,
// //         currentIndex: _activePage,
// //         onTap: (index) {
// //           _pageViewController.animateToPage(index,
// //               duration: const Duration(milliseconds: 200),
// //               curve: Curves.bounceOut);
// //         },
// //         items: List.generate(_activeIcons.length, (index) {
// //           return BottomNavigationBarItem(
// //             icon: Icon(
// //               _inactiveIcons[index],
// //             ),
// //             activeIcon: Icon(
// //               _activeIcons[index],
// //             ),
// //             label: _label[index],
// //           );
// //         }),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:murphys_technology/screens/homepage/homepage.dart';
// import 'package:murphys_technology/screens/pricing/pricing.dart';
// import 'package:murphys_technology/screens/pricing/pricing_page.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 0;

//   final List<Widget> _widgetOptions = [
//     const HomePage(),
//     const PricingDetails(),
//     const PricingPage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   // Future<void> initPlatformState() async {
//   //   try {
//   //     String deviceToken = await Pushy.register();
//   //   } on PlatformException catch (error) {}
//   // }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   initPlatformState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(
//               CupertinoIcons.home,
//               color: Colors.black,
//             ),
//             label: 'Home',
//             backgroundColor: Colors.white,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               CupertinoIcons.money_dollar,
//               color: Colors.black,
//             ),
//             label: 'jobs',
//             backgroundColor: Colors.white,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               CupertinoIcons.person,
//               color: Colors.black,
//             ),
//             label: 'Profile',
//             backgroundColor: Colors.white,
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.black,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class BrandingScreen extends StatefulWidget {
//   const BrandingScreen({super.key});

//   @override
//   State<BrandingScreen> createState() => _BrandingScreenState();
// }

// class _BrandingScreenState extends State<BrandingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 202, 222, 242),
//       body: SafeArea(
//           child: Container(
//         child: Stack(
//           children: [
//             Opacity(
//               opacity: 0.5,
//               child: ClipPath(
//                 clipper: WaveClipper(),
//                 child: Container(
//                   color: const Color(0xff1C6BFE),
//                   height: 200,
//                 ),
//               ),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     debugPrint(
//       size.width.toString(),
//     );
//     var path = Path();
//     path.lineTo(0, size.height);

//     var firstStart = Offset(size.width / 5, size.height);

//     var firstEnd = Offset(size.width / 2.5, size.height - 50);

//     path.quadraticBezierTo(
//       firstStart.dx,
//       firstStart.dy,
//       firstEnd.dx,
//       firstEnd.dy,
//     );

//     var secondStart =
//         Offset(size.width - (size.width / 3.24), size.height - 105);

//     var secondEnd = Offset(size.width, size.height - 10);

//     path.quadraticBezierTo(
//       secondStart.dx,
//       secondStart.dy,
//       secondEnd.dx,
//       secondEnd.dy,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     throw UnimplementedError();
//   }
// }
import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class BrandingScreen extends StatefulWidget {
  const BrandingScreen({super.key});

  @override
  State<BrandingScreen> createState() => _BrandingScreenState();
}

class _BrandingScreenState extends State<BrandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: getDeviceHeight(context),
                width: getDeviceWidth(context),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://www.murphystechnology.com.au/img/homebanner1.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipPath(
                      clipper: CustomClipPath(),
                      child: Container(
                        height: getDeviceHeight(context) * 0.3,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/logo.png"),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff762C8B),
                              Color(0xff5496FE),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: getDeviceHeight(context) * 0.35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Grow 10X Faster,",
                        style: TextStyle(
                            wordSpacing: 2,
                            letterSpacing: 2,
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "poppins"),
                      ),
                      Text(
                        "Better, Smater",
                        style: TextStyle(
                            wordSpacing: 2,
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 20,
                            fontFamily: "poppins"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "We will create best website and app",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            wordSpacing: 2,
                            letterSpacing: 2,
                            fontFamily: "poppins"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "We help you to grow your business",
                        style: TextStyle(
                          fontSize: 20,
                          wordSpacing: 2,
                          color: Colors.white,
                          letterSpacing: 2,
                          fontFamily: "poppins",
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

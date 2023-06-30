// import 'package:flutter/material.dart';

// class SupportScreen extends StatefulWidget {
//   const SupportScreen({super.key});

//   @override
//   State<SupportScreen> createState() => _SupportScreenState();
// }

// class _SupportScreenState extends State<SupportScreen> {
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
//                   color: Colors.deepOrangeAccent,
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
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:url_launcher/url_launcher.dart';

const LatLng currentLocation = LatLng(-33.8639267323735, 151.08148255582145);

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  Uri dialnumber = Uri(scheme: 'tel', path: '9861099262');
  callnumber() async {
    await launchUrl(dialnumber);
  }

  _launchURL() async {
    Uri _url = Uri.parse('https://www.murphystechnology.com.au');
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  _launchEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'our.email@gmail.com',
      queryParameters: {'subject': '', 'body': ''},
    );
    launchUrl(emailLaunchUri);
  }

  late GoogleMapController mapController;
  Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff463f97),
        elevation: 0,
      ),
      body: Container(
        height: getDeviceHeight(context),
        width: getDeviceWidth(context),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff463f97),
              // Color.fromARGB(255, 222, 140, 221),
              Color.fromARGB(255, 195, 191, 236),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getDeviceHeight(context) * 0.02,
              ),
              Center(child: Image.asset("images/logo.png")),
              SizedBox(
                height: getDeviceHeight(context) * 0.1,
              ),
              const Text(
                "Contact us",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "9812345678",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final Uri url = Uri(
                            scheme: "sms",
                            path: '9876543219',
                          );
                          await launchUrl(url);
                        },
                        child: Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 109, 179, 237),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.sms,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: callnumber,
                        child: Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 109, 179, 237),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.05,
              ),
              const Text(
                "Email id",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.01,
              ),
              GestureDetector(
                onTap: _launchEmail,
                child: const Text(
                  "info@murthystechnology.com",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.05,
              ),
              const Text(
                "Website",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.01,
              ),
              InkWell(
                onTap: _launchURL,
                child: const Text(
                  "https://www.murphystechnology.com.au",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.05,
              ),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.9,
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: currentLocation,
                    zoom: 14,
                  ),
                  onMapCreated: (controller) {
                    mapController = controller;
                    addMarker("test", currentLocation);
                  },
                  markers: _markers.values.toSet(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addMarker(String id, LatLng location) {
    var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: const InfoWindow(
          title: "Murphys Technology",
        ));
    _markers[id] = marker;
    setState(() {});
  }
}

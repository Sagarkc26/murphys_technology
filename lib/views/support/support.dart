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
  Uri dialnumber = Uri(scheme: 'tel', path: '02 7254 4827');
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
      path: 'info@murphystechnology.com',
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
              const SizedBox(
                height: 15,
              ),
              const Center(
                  child: Text(
                "ABN : 97 628 755 055",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "For billing / Technical support",
                style: TextStyle(
                  fontSize: 20,
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
                    "02 7254 4827",
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
                            path: '0488853623',
                          );
                          await launchUrl(url);
                        },
                        child: Container(
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 72, 135, 253),
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
                            color: const Color.fromARGB(255, 72, 135, 253),
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
                "Email us",
                style: TextStyle(
                  fontSize: 20,
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
                "Our Website",
                style: TextStyle(
                  fontSize: 20,
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
                  "www.murphystechnology.com.au",
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
                height: getDeviceHeight(context) * 0.24,
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

import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class PageViewlist extends StatelessWidget {
  const PageViewlist({
    super.key,
    required PageController pageController,
    required this.ourServices,
  }) : _pageController = pageController;

  final PageController _pageController;
  final List<Map> ourServices;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: getDeviceHeight(context) * 0.2,
      width: getDeviceWidth(context),
      child: PageView.builder(
        controller: _pageController,
        itemCount: ourServices.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: getDeviceWidth(context),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff5955A0), Color(0xffAB9EE4)],
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Container(
                    height: getDeviceHeight(context) * 0.22,
                    width: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/servicepic.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ourServices[index]['name'],
                          style: TextStyle(
                            fontSize: getDeviceWidth(context) * 0.05 +
                                getDeviceHeight(context) * 0.0008,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.8),
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(
                          width: getDeviceWidth(context) * 0.41,
                          child: Text(
                            ourServices[index]['description'],
                            style: TextStyle(
                              fontSize: height > 860
                                  ? getDeviceWidth(context) * 0.036 +
                                      getDeviceHeight(context) * 0.0008
                                  : getDeviceWidth(context) * 0.032 +
                                      getDeviceHeight(context) * 0.0008,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

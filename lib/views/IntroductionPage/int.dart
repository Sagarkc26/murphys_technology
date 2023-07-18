import 'package:flutter/material.dart';
import 'package:murphys_technology/routes/routesName.dart';
import 'package:murphys_technology/views/IntroductionPage/content_model.dart';
import 'package:murphys_technology/utils/device_size.dart';

class IntSlider extends StatefulWidget {
  const IntSlider({super.key});

  @override
  State<IntSlider> createState() => _IntSliderState();
}

class _IntSliderState extends State<IntSlider> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 241, 247),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contexts.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: getDeviceHeight(context),
                          width: getDeviceWidth(context),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  contexts[index].image,
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                Container(
                  height: getDeviceHeight(context) * 0.3,
                  width: getDeviceWidth(context),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 202, 222, 242),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentIndex == contexts.length - 2
                              ? "Grow 10X Faster,"
                              : currentIndex == contexts.length - 1
                                  ? "Are you ready "
                                  : "We help you to ",
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                          ),
                        ),
                        Text(
                          currentIndex == contexts.length - 2
                              ? "Better, Smarter"
                              : currentIndex == contexts.length - 1
                                  ? "to grow your business?"
                                  : "grow your business",
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                          ),
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 55,
                              margin: const EdgeInsets.only(
                                bottom: 40,
                                left: 10,
                              ),
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff1C6BFE),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: currentIndex ==
                                            contexts.length - 2
                                        ? BorderRadius.circular(15)
                                        : currentIndex == contexts.length - 1
                                            ? const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15),
                                              )
                                            : const BorderRadius.only(
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15),
                                              ),
                                  ),
                                ),
                                onPressed: () {
                                  if (currentIndex == contexts.length - 1) {
                                    Navigator.pushNamed(
                                        context, RoutesName.login);
                                  }
                                  _controller.nextPage(
                                      duration:
                                          const Duration(microseconds: 100),
                                      curve: Curves.bounceIn);
                                },
                                child: Text(
                                  currentIndex == contexts.length - 2
                                      ? "Continue"
                                      : currentIndex == contexts.length - 1
                                          ? "Let's Roll"
                                          : "Start",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: getDeviceHeight(context) * 0.01,
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: List.generate(
                                        contexts.length,
                                        (index) => buildDot(index),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getDeviceHeight(context) * 0.045,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 10,
      margin: const EdgeInsets.only(right: 5),
      width: currentIndex == index ? 20 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff1C6BFE),
      ),
    );
  }
}

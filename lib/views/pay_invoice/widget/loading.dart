import 'dart:async';
import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/pay_invoice/widget/completed.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:video_player/video_player.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late VideoPlayerController _controller;

  double _percent = 1.0;
  int _remainingTime = 5;
  int _percentt = 0;
  late Timer _timers;
  late Timer _timer;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Completed(),
        ),
      );
    });
    super.initState();
    _controller = VideoPlayerController.asset('images/loadingg.mp4')
      ..initialize().then((_) {
        // Ensure the video starts playing
        _controller.play();
        setState(() {});
      });
    _startPercent();
    _startTimer();
    // TODO: implement initState
    super.initState();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        }
      });
    });
  }

  void _startPercent() {
    _timers = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_percentt < 100) {
          _percentt += 20;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _timers.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: getDeviceHeight(context),
            width: getDeviceWidth(context),
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
          Positioned(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Loading",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white.withOpacity(0.7),
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "$_percentt %",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white.withOpacity(0.7),
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Time left : ",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      "$_remainingTime sec",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LinearPercentIndicator(
                        barRadius: const Radius.circular(40),
                        width: getDeviceWidth(context) * 0.7,
                        animation: true,
                        lineHeight: 5,
                        animationDuration: 5000,
                        percent: _percent,
                        // center: Text(
                        //   _percent.toString() + "%",
                        //   style: const TextStyle(
                        //     color: Colors.white,
                        //   ),
                        // ),
                        backgroundColor: Colors.grey[300],
                        progressColor: const Color(0xff1C6BFE),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 45,
                  width: 140,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1C6BFE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:murphys_technology/views/pay_invoice/widget/payment_completed.dart';
import 'package:video_player/video_player.dart';

class PracticeScreen extends StatefulWidget {
  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoadingCompleted(),
          ));
    });
    super.initState();
    _controller = VideoPlayerController.asset('images/loadingg.mp4')
      ..initialize().then((_) {
        // Ensure the video starts playing
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Customize your splash screen UI here
      body: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }
}

// class PracticeScreen extends StatefulWidget {
//   @override
//   _PracticeScreenState createState() => _PracticeScreenState();
// }

// class _PracticeScreenState extends State<PracticeScreen> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset('images/loadingg.mp4')
//       ..initialize().then((_) {
//         // Ensure the video starts playing
//         _controller.play();
//         _controller.setLooping(true);
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _controller.value.isInitialized
//           ? AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayer(_controller),
//             )
//           : Container(), // Placeholder widget until video is initialized
//     );
//   }
// }

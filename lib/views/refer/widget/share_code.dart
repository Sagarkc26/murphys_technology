import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareCode extends StatelessWidget {
  const ShareCode({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              await Share.share(text);
            },
            child: const Icon(
              Icons.share,
              color: Color(0xff1C6BFE),
              size: 40,
            ),
          ),
          // const Text(
          //   "Share",
          //   style: TextStyle(
          //     fontSize: 12,
          //     fontFamily: "Poppins",
          //     fontWeight: FontWeight.bold,
          //   ),
          // )
        ],
      ),
    );
  }
}

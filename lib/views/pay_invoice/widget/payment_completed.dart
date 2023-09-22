import 'package:flutter/material.dart';
import 'package:murphys_technology/views/bottomNavBar/bot.dart';

class LoadingCompleted extends StatefulWidget {
  const LoadingCompleted({super.key});

  @override
  State<LoadingCompleted> createState() => _LoadingCompletedState();
}

class _LoadingCompletedState extends State<LoadingCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/complete.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Thank you",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Text(
                "for your purchase",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Your service will be activated in 20-30 minutes.",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Text(
                'Please check your email for your order confirmation.',
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.4),
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
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNB(index: 1),
                        ),
                        (route) => false);
                  },
                  child: const Text(
                    "Go back",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

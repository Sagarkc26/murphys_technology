import 'package:flutter/material.dart';

class List1 extends StatelessWidget {
  List1({
    super.key,
  });

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _cardController = TextEditingController();
  TextEditingController _validController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Card number",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          TextFormField(
            controller: _cardController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter your card number";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 40,
                  width: 70,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/master.png"))),
                ),
              ),
              hintText: "* * * *  * * * *  * * * *  * * * *",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Valid Until",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                      ),
                    ),
                    TextFormField(
                      controller: _validController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter valid date";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Month / Year",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "CVV",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                      ),
                    ),
                    TextFormField(
                      controller: _cvvController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your CVV";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "* * * *",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Card holder",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          TextFormField(
            controller: _nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter your name";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              hintText: "Your name and surname",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

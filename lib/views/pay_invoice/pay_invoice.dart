import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/pay_invoice/widget/list1.dart';
import 'package:murphys_technology/views/pay_invoice/widget/list2.dart';
import 'package:murphys_technology/views/pay_invoice/widget/list3.dart';

class PayInvoice extends StatefulWidget {
  const PayInvoice({super.key});

  @override
  State<PayInvoice> createState() => _PayInvoiceState();
}

class _PayInvoiceState extends State<PayInvoice> {
  List<String> items = [
    "Card",
    "PayPal",
    "Bank",
  ];
  List<IconData> icon = [
    CupertinoIcons.check_mark_circled,
    CupertinoIcons.check_mark_circled,
    CupertinoIcons.check_mark_circled,
  ];

  int currentIndex = 0;
  bool isSwitched = false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _totalprice = TextEditingController();
  final TextEditingController _invoicenumber = TextEditingController();
  // List<dynamic> data = [
  //   List1(),
  //   List2(),
  //   const List3(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        backgroundColor: const Color.fromARGB(255, 202, 222, 242),
        elevation: 0,
        title: const Text(
          "Pay Invoice",
          style: TextStyle(
            fontFamily: "poppins",
            fontSize: 25,
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _key,
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Total price",
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: getDeviceHeight(context) * 0.01,
                          ),
                          SizedBox(
                            height: getDeviceHeight(context) * 0.07,
                            child: TextFormField(
                              controller: _totalprice,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.attach_money_outlined,
                                  color: Colors.blue,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Invoice number",
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: getDeviceHeight(context) * 0.07,
                            child: TextFormField(
                              controller: _invoicenumber,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                                fontFamily: "Poppins",
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(top: 9, left: 17),
                                  child: Text(
                                    "#",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.01,
              ),
              const Text(
                "Payment Method",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: getDeviceHeight(context),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getDeviceHeight(context) * 0.075,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 5, left: 5),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      width: getDeviceWidth(context) * 0.277,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: currentIndex == index
                                            ? const Color(0xff1C6BFE)
                                            : const Color.fromARGB(
                                                255, 132, 197, 250),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              items[index],
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 16,
                                                color: currentIndex == index
                                                    ? Colors.white
                                                    : Colors.black
                                                        .withOpacity(0.4),
                                              ),
                                            ),
                                            Icon(
                                              icon[currentIndex],
                                              size: 27,
                                              color: currentIndex == index
                                                  ? Colors.white
                                                      .withOpacity(0.9)
                                                  : Colors.black
                                                      .withOpacity(0.4),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Visibility(
                                  //   visible: currentIndex == index,
                                  //   child: Container(
                                  //     width: 5,
                                  //     height: 5,
                                  //     decoration: const BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       color: Colors.deepPurpleAccent,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      //Main Body
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: getDeviceWidth(context),
                            height: getDeviceHeight(context) * 0.55,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  currentIndex == 0
                                      ? List1(
                                          totalprice: _totalprice.text,
                                          invoice: _invoicenumber.text,
                                        )
                                      : currentIndex == 1
                                          ? List2(
                                              price: _totalprice.text,
                                              invoice: _invoicenumber.text,
                                            )
                                          : const List3()
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // currentIndex == 0 || currentIndex == 1
                          //     ? Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           const Text(
                          //             "Save card data for future payments",
                          //             style: TextStyle(
                          //               fontSize: 14,
                          //               fontFamily: "Poppins",
                          //             ),
                          //           ),
                          //           Transform.scale(
                          //             scale: 0.8,
                          //             child: CupertinoSwitch(
                          //               activeColor: const Color.fromARGB(
                          //                   255, 99, 183, 253),
                          //               thumbColor: const Color(0xff1C6BFE),
                          //               trackColor: Colors.blueGrey.shade300,
                          //               // activeColor: const Color(0xff1C6BFE),
                          //               // activeTrackColor: Colors.blue,
                          //               // inactiveThumbColor: Colors.blueGrey,
                          //               // inactiveTrackColor: Colors.blueGrey.shade600,
                          //               // splashRadius: 50,
                          //               value: isSwitched,
                          //               onChanged: (value) =>
                          //                   setState(() => isSwitched = value),
                          //             ),
                          //           ),
                          //         ],
                          //       )
                          //     : Container(),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // currentIndex == 0 || currentIndex == 1
                          //     ? SizedBox(
                          //         height: 50,
                          //         width: getDeviceWidth(context) * 0.8,
                          //         child: ElevatedButton(
                          //           style: ElevatedButton.styleFrom(
                          //             backgroundColor: const Color(0xff1C6BFE),
                          //             shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(20),
                          //             ),
                          //           ),
                          //           onPressed: () {
                          //             Navigator.of(context)
                          //                 .push(MaterialPageRoute(
                          //               builder: (context) =>
                          //                   const LoadingScreen(),
                          //             ));
                          //           },
                          //           child: const Text(
                          //             "Proceed to confirm",
                          //             style: TextStyle(
                          //               fontSize: 17,
                          //               fontWeight: FontWeight.w500,
                          //               fontFamily: "Poppins",
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

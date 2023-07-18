import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/services/services.dart';

class Greeting extends StatelessWidget {
  Greeting({
    super.key,
    required this.message,
    required this.icon,
  });

  final String message;
  final IconData icon;
  List<Map> services = [
    {
      "name": "Full Business Branding",
      "description":
          "Creating a distinct identity for a business in the mind of your target audience and consumers and made up of a company's name and logo, visual design, mission, and tone of voice",
      // "images": "images/services/fullbusinessbranding.png",
      'images': "images/fullbusinessbranding.png",
      "rating": "4.7",
      "price": "\$3500",
    },
    {
      "name": "Website Design",
      "description":
          "Provide us your business details and we will create easy-to-update and feature-rich fully customized web design for your business.",
      "images": "images/websitedesign.jpg",
      "rating": "4.6",
      "price": "\$899",
    },
    {
      "name": "SEO Service",
      "description":
          "Rank on google and get noticed we’re all about making your business visible.",
      "images": "images/seoservice.png",
      "rating": "4.3",
      "price": "\$1600",
    },
    {
      "name": "Digital Marketing",
      "description":
          "SEO and Digital Marketing packages customized to your business goals, designed to increase your digital footprint and online visibility making it easier for potential leads to find you online.",
      "images": "images/digitalmarketing.jpg",
      "rating": "4.5",
      "price": "\$900",
    },
    {
      "name": "Website Hosting",
      "description":
          "online service that makes your website’s content accessible on the internet.When you purchase a hosting plan, you are renting space on a physical server to store all the website’s files and data. ",
      "images": "images/webhosting.jpg",
      "rating": "4.5",
      "price": "\$230",
    },
    {
      "name": "Social Media",
      "description":
          "Creating a distinct identity for a business in the mind of your target audience and consumers and made up of a company's name and logo, visual design, mission, and tone of voice",
      "images": "images/socialmedia.png",
      "rating": "4.7",
      "price": "\$250",
    },
    {
      "name": "Content Writing",
      "description":
          "Creating a distinct identity for a business in the mind of your target audience and consumers and made up of a company's name and logo, visual design, mission, and tone of voice",
      "images": "images/contentwritting.png",
      "rating": "4.0",
      "price": "\$290",
    },
    {
      "name": "Google My business",
      "description":
          "Creating a distinct identity for a business in the mind of your target audience and consumers and made up of a company's name and logo, visual design, mission, and tone of voice",
      "images": "images/business.png",
      "rating": "4.1",
      "price": "\$250",
    },
    {
      "name": "Google adwords",
      "description":
          "Promote your business, help sell products or services, raise awareness, and increase traffic to your website",
      "images": "images/googleadwords.png",
      "rating": "4.7",
      "price": "Depends",
    },
    {
      "name": "Brochure",
      "description":
          "From product, events, medical, and even real estate brochures, our professional templates can help you create engaging custom brochures in minutes — no design skills needed!",
      "images": "images/graphicsdesign.png",
      "rating": "4.3",
      "price": "\$200",
    },
    {
      "name": "Logo Design",
      "description":
          "We are helping our clients to grow their business by providing them the brands they deserve. We expertise in graphic design and brand creation like brochure, flyer, business card and logo design.",
      "images": "images/logodesign.png",
      "rating": "4.8",
      "price": "\$250",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50,
          width: 200,
          child: Row(
            children: [
              Text(
                message,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                icon,
                color: Colors.white,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: const Color.fromARGB(255, 227, 239, 250),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              context: context,
              builder: (context) {
                return FractionallySizedBox(
                  heightFactor: 0.76,
                  child: SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: getDeviceHeight(context) * 0.73,
                            child: ListView.builder(
                              itemCount: services.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => Servicess(
                                          price: services[index]['price'],
                                          rating: services[index]['rating'],
                                          image: services[index]['images'],
                                          name: services[index]['name'],
                                          description: services[index]
                                              ['description']),
                                      transition: Transition.circularReveal,
                                    );
                                  },
                                  child: ListTile(
                                    title: Text(
                                      services[index]['name'],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            height: 47,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(
                    Icons.headset_mic_outlined,
                    size: 20,
                  ),
                ),
                Text(
                  "Services",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"),
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget menu(VoidCallback onpress, String name, BuildContext context) {
  return MenuItemButton(
    onPressed: onpress,
    child: MenuAcceleratorLabel(name),
  );
}

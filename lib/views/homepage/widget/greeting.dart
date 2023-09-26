import 'package:flutter/material.dart';
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
          "Business image and identity matter – especially when consumers discover most information about companies online. A key difference between corporate brand and your brand overall is a corporate brand defines your business",
      // "images": "images/services/fullbusinessbranding.png",
      'images': "images/fullbusinessbranding.png",
      "rating": "4.7",
      "price": "\$3500",
    },
    {
      "name": "Website Design",
      "description":
          "As full service specialists in web design, You can benefit by our inspiring design, custom web development and innovative marketing. We inspire our customers with a comprehensive suite of website development.",
      "images": "images/websitedesign.jpg",
      "rating": "4.6",
      "price": "\$899",
    },
    {
      "name": "SEO Service",
      "description":
          "Grow your business with a customised SEO strategy from Murphys Technology. Whether you have small business , or an enterprise-level organisation , our award-winning SEO services will drive more traffic, more leads, and more enquiries.",
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
          "Looking to start your own online business? That is fantastic! The first thing you need for that is a website that is hosted on a reliable and dependable web host. Contact Us",
      "images": "images/webhosting.jpg",
      "rating": "4.5",
      "price": "\$230",
    },
    {
      "name": "Social Media",
      "description":
          "The power of social media is huge and the difference it can make to your business is even bigger! We offers professional social media management services for business all across Sydney and Australia",
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
          "Consumers who find your Google My Business will click through to your website. As a Google My Business Partner, we can help you get your profile seen by locals.",
      "images": "images/business.png",
      "rating": "4.1",
      "price": "\$250",
    },
    {
      "name": "Google Adwords",
      "description":
          "We provide Google Ads management without contracts. You can benefit from our Google AdWords services, which help create and manage effective online advertising campaigns",
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
          "We’ve worked with businesses in all sorts of industries, from designing brand-new logos for startups all the way to helping large corporations to rebuild their brand identity.",
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
                  fontSize: getDeviceWidth(context) * 0.045 +
                      getDeviceHeight(context) * 0.0008,
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
          onTap: () async {
            await showModalBottomSheet(
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
                  heightFactor: 0.73,
                  child: SizedBox(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: getDeviceHeight(context) * 0.7,
                            child: ListView.builder(
                              itemCount: services.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Servicess(
                                          price: services[index]['price'],
                                          rating: services[index]['rating'],
                                          image: services[index]['images'],
                                          name: services[index]['name'],
                                          description: services[index]
                                              ['description'],
                                        ),
                                      )),
                                  child: ListTile(
                                    title: Text(
                                      services[index]['name'],
                                      style: TextStyle(
                                        fontSize: getDeviceWidth(context) *
                                                0.036 +
                                            getDeviceHeight(context) * 0.0008,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
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
              children: [
                const SizedBox(
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
                      fontSize: getDeviceWidth(context) / 25,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins"),
                ),
                const Icon(
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

import 'package:flutter/material.dart';
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
      "name": "Full Business  Branding",
      "description":
          "Creating a distinct identity for a business in the mind of your target audience and consumers and made up of a company's name and logo, visual design, mission, and tone of voice",
    },
    {
      "name": "Website Design",
      "description":
          "Provide us your business details and we will create easy-to-update and feature-rich fully customized web design for your business. No issue, we will convert the design into neat, hand-coded, W3C standards, semantic, SEO optimized and cross-browser compatible.",
    },
    {
      "name": "SEO Service",
      "description":
          "Rank on google and get noticed we’re all about making your business visible.",
    },
    {
      "name": "Digital Marketing",
      "description":
          "SEO and Digital Marketing packages customized to your business goals, designed to increase your digital footprint and online visibility making it easier for potential leads to find you online.",
    },
    {
      "name": "Website Hosting",
      "description":
          "online service that makes your website’s content accessible on the internet.When you purchase a hosting plan, you are renting space on a physical server to store all the website’s files and data. ",
    },
    {
      "name": "Social Media",
      "description":
          "Creating a distinct identity for a business in the mind of your target audience and consumers and made up of a company's name and logo, visual design, mission, and tone of voice",
    },
    {
      "name": "Content Writing",
      "description":
          "Creating a distinct identity for a business in the mind of your target audience and consumers and made up of a company's name and logo, visual design, mission, and tone of voice",
    },
    {
      "name": "Google My business",
      "description":
          "Creating a distinct identity for a business in the mind of your target audience and consumers and made up of a company's name and logo, visual design, mission, and tone of voice",
    },
    {
      "name": "Google adwords",
      "description":
          "Promote your business, help sell products or services, raise awareness, and increase traffic to your website",
    },
    {
      "name": "Brochure",
      "description":
          "From product, events, medical, and even real estate brochures, our professional templates can help you create engaging custom brochures in minutes — no design skills needed!",
    },
    {
      "name": "Logo Design",
      "description":
          "We are helping our clients to grow their business by providing them the brands they deserve. We expertise in graphic design and brand creation like brochure, flyer, business card and logo design.",
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
        MenuBar(
          style: MenuStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          children: [
            SubmenuButton(
              menuChildren: [
                SizedBox(
                  height: 560,
                  width: 190,
                  child: ListView.builder(
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return menu(
                        () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Servicess(
                                name: services[index]['name'],
                                description: services[index]['description'],
                              ),
                            ),
                          );
                        },
                        services[index]['name'],
                        context,
                      );
                    },
                  ),
                ),
                // menu(() {
                //   Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const Servicess(),
                //   ));
                // }, "Full Business Branding", context),
                // menu(() {
                //   Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const Servicess(),
                //   ));
                // }, "Website Design", context),
                // menu(() {}, "SEO Service", context),
                // menu(() {}, "Digital Marketing", context),
                // menu(() {}, "Website Hosting", context),
                // menu(() {}, "Social Media", context),
                // menu(() {}, "Content Writing", context),
                // menu(() {}, "Google My business", context),
                // menu(() {}, "Google Ad words", context),
                // menu(() {}, "Brochure", context),
                // menu(() {}, "Logo Design", context),
                // MenuItemButton(
                //     style: ButtonStyle(),
                //     onPressed: () {
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => Servicess(),
                //       ));
                //       // showAboutDialog(
                //       //     context: context,
                //       //     applicationName: 'MenuBar Sample',
                //       //     applicationVersion: "1.0.0");
                //     },
                //     child: const MenuAcceleratorLabel("& Logo Design")),
              ],
              child: SizedBox(
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
            )
          ],
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

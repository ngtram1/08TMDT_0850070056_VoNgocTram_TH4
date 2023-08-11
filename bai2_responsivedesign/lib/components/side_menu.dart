import 'package:flutter/material.dart';
import 'package:bai2_responsivedesign/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';
import '../extensions.dart';
import 'side_menu_item.dart';
import 'tags.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/Logo Outlook.png",
                    width: 46,
                  ),
                  const Spacer(),
                  // We don't want to show this close button on Desktop mood
                  if (!Responsive.isDesktop(context)) const CloseButton(),
                ],
              ),
              const SizedBox(height: kDefaultPadding),
              TextButton.icon(
                onPressed: () {
    // Add your onPressed logic here
              },
              style: TextButton.styleFrom(
              minimumSize: const Size(double.infinity, kDefaultPadding),
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: kPrimaryColor,
              ),
              icon: WebsafeSvg.asset("assets/Icons/Edit.svg", width: 16),
              label: const Text(
              "New message",
              style: TextStyle(color: Colors.white),
            ),
            ).addNeumorphism(
              topShadowColor: Colors.white,
              bottomShadowColor: const Color(0xFF234395).withOpacity(0.2),
            ),
          const SizedBox(height: kDefaultPadding),
          TextButton.icon(
          onPressed: () {
          // Add your onPressed logic here
          },
          style: TextButton.styleFrom(
          minimumSize: const Size(double.infinity, kDefaultPadding),
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: kBgDarkColor,
          ),
          icon: WebsafeSvg.asset("assets/Icons/Download.svg", width: 16),
          label: const Text(
          "Get messages",
          style: TextStyle(color: kTextColor),
          ),
          ).addNeumorphism(),
              const SizedBox(height: kDefaultPadding * 2),
              // Menu Items
              SideMenuItem(
                press: () {},
                title: "Inbox",
                iconSrc: "assets/Icons/Inbox.svg",
                isActive: true,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {},
                title: "Sent",
                iconSrc: "assets/Icons/Send.svg",
                isActive: false,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {},
                title: "Drafts",
                iconSrc: "assets/Icons/File.svg",
                isActive: false,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {},
                title: "Deleted",
                iconSrc: "assets/Icons/Trash.svg",
                isActive: false,
                showBorder: false,
                itemCount: 3,
              ),

              const SizedBox(height: kDefaultPadding * 2),
              // Tags
              const Tags(),
            ],
          ),
        ),
      ),
    );
  }
}
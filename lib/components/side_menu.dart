import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_flutter/components/side_menu_item.dart';
import 'package:web_flutter/components/tags.dart';
import 'package:web_flutter/feature/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';
import '../extensions.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

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
                  if (!Responsive.isDesktop(context)) const CloseButton(),
                ],
              ),
              const SizedBox(height: kDefaultPadding),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding,
                    ),
                  ),
                  onPressed: () {},
                  icon: WebsafeSvg.asset("assets/Icons/Edit.svg", width: 16),
                  label: const Text(
                    "New message",
                    style: TextStyle(color: Colors.white),
                  ),
                ).addNeumorphism(
                  topShadowColor: Colors.white,
                  bottomShadowColor: const Color(0xFF234395).withOpacity(0.2),
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: kBgDarkColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding,
                    ),
                  ),
                  onPressed: () {},
                  icon:
                      WebsafeSvg.asset("assets/Icons/Download.svg", width: 16),
                  label: const Text(
                    "Get messages",
                    style: TextStyle(color: kTextColor),
                  ),
                ).addNeumorphism(),
              ),
              const SizedBox(height: kDefaultPadding * 2),
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
              ),
              SideMenuItem(
                press: () {},
                title: "Drafts",
                iconSrc: "assets/Icons/File.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Deleted",
                iconSrc: "assets/Icons/Trash.svg",
                isActive: false,
                showBorder: false,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              const Tags(),
            ],
          ),
        ),
      ),
    );
  }
}

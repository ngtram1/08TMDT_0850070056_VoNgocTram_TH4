// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';
import 'counter_badge.dart';

//Color kPrimaryColor = Colors.blue;
//Color kGrayColor = Colors.grey;
bool isActive = true;
bool isHover = false;
Color desiredColor = (isActive || isHover) ? kPrimaryColor : kGrayColor;
//Color desiredColor = (isActive || isHover) ? kPrimaryColor : kGrayColor;


class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key? key,
    required this.isActive,
    this.isHover = false,
    required this.itemCount,
    this.showBorder = true,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  final bool isActive, isHover, showBorder;
  final int itemCount;
  final String iconSrc, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            (isActive || isHover)
                ? WebsafeSvg.asset(
              "assets/Icons/Angle right.svg",
              width: 15,
            )
                : const SizedBox(width: 15),
            const SizedBox(width: kDefaultPadding / 4),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder
                    ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFDFE2EF)),
                  ),
                )
                    : null,
                child: Row(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(desiredColor, BlendMode.srcIn),
                      child: WebsafeSvg.asset(
                        iconSrc,
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: kDefaultPadding * 0.75),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: (isActive || isHover) ? kTextColor : kGrayColor,
                      ),
                    ),
                    const Spacer(),
                    if (itemCount == true) CounterBadge(count: itemCount),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
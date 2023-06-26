import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planet_gadget/library/textstyle.dart';
import 'package:sizer/sizer.dart';

import '../../../library/color.dart';
import '../../../utils/constants/path.dart';
import '../../core/appbar_widget.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: RefreshIndicator(
            onRefresh: () {
              return refresh();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 24),
                      Text("Member", style: inter20Bold()),
                      const SizedBox(height: 24),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        // padding: const EdgeInsets.all(16),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return InkWell(
                                  onTap: () {},
                                  child: memberCard(
                                      name: "Yoshua",
                                      point: "100",
                                      level: "Priority",
                                      iconPath: "priority.svg",
                                      backgroundPath: "bg_black.jpg",
                                      textColor: white));
                            }
                            return InkWell(
                                onTap: () {},
                                child: memberCard(
                                    name: "Yoshua",
                                    point: "100",
                                    level: "Gold",
                                    iconPath: "member.svg",
                                    backgroundPath: "bg_yellow.jpg"));
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemCount: 2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Benefit Member", style: inter16Bold()),
                                const SizedBox(width: 8),
                                SvgPicture.asset('${iconsPath}lock_open.svg',
                                    width: 14, height: 14),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return cardBenefitMember();
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 8),
                                itemCount: 8),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  refresh() {}

  Widget memberCard({
    required String name,
    required String point,
    required String level,
    required String iconPath,
    required String backgroundPath,
    Color? textColor,
  }) {
    return Container(
      width: 90.w,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("$backgroundsPath$backgroundPath"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style:
                      textColor == null ? inter28Bold() : inter28BoldWhite()),
              Column(children: <Widget>[
                SvgPicture.asset(
                  "$iconsPath$iconPath",
                  width: 16,
                  height: 16,
                ),
                const SizedBox(height: 4),
                Text(level,
                    style: textColor == null
                        ? inter12BoldBlack()
                        : inter12BoldWhite()),
              ]),
            ],
          ),
          const SizedBox(height: 8),
          Text("Your Point : $point",
              style: textColor == null ? inter14Bold() : inter14BoldWhite())
        ],
      ),
    );
  }

  Widget cardBenefitMember() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: grayBorder),
          borderRadius: BorderRadius.circular(12),
          color: white),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 72,
              decoration: BoxDecoration(
                  color: secondaryBlue,
                  borderRadius: BorderRadius.circular(12)),
              child:
                  SvgPicture.asset('${iconsMemberPath}lifetime_membership.svg'),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Lifetime Membership", style: inter14Bold()),
                const SizedBox(height: 7),
                Text("Register once, shopping easy and special forever",
                    style: inter12MediumBlack2()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

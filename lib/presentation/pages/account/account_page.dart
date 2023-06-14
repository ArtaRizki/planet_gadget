import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_gadget/library/convert_currency.dart';
import 'package:planet_gadget/library/textstyle.dart';
import 'package:planet_gadget/presentation/pages/account/setting_account_page.dart';
import 'package:sizer/sizer.dart';

import '../../../library/color.dart';
import '../../../library/decoration.dart';
import '../../../utils/constants/path.dart';
import '../best_selling_product/best_selling_product_page.dart';
import '../brand/all_brand_page.dart';
import '../choice_for_you/choice_for_you_page.dart';
import '../new_product/new_product_page.dart';
import '../product/product_page.dart';
import '../promo/promo_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController searchC = TextEditingController();
  String searchValue = "";
  List searchResult = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: RefreshIndicator(
            onRefresh: () {
              return refresh();
            },
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.contain,
                        image:
                            AssetImage("${backgroundsPath}bg_dashboard.jpg"))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.navigate_before,
                                color: white,
                                size: 32,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                              flex: 8,
                              child:
                                  Text("Account", style: inter20BoldWhite())),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: SvgPicture.asset(
                                    '${iconsAccountPath}shopping-cart_white.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SettingAccountPage())),
                                    child: SvgPicture.asset(
                                      '${iconsAccountPath}edit_white.svg',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 26, 10, 12),
                        child: memberCard(
                            name: "Yoshua",
                            point: "100",
                            level: "Gold",
                            iconPath: "member.svg",
                            backgroundPath: "bg_yellow.jpg")),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("My Purchases", style: inter16Bold()),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text("Purchase history",
                                        style: inter12Black2()),
                                    Icon(
                                      Icons.navigate_next,
                                      color: black,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Divider(thickness: 1, color: black3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              iconBox(name: "To Pay", iconName: "to_pay.svg"),
                              iconBox(name: "Packing", iconName: "packing.svg"),
                              iconBox(
                                  name: "Delivery", iconName: "delivery.svg"),
                              iconBox(name: "Arrived", iconName: "arrived.svg"),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text("Account Setting", style: inter16Bold()),
                          Divider(thickness: 1, color: black3),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: SvgPicture.asset(
                                    "${iconsAccountPath}address_list.svg"),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Address List",
                                          style: inter14Bold()),
                                      const SizedBox(height: 4),
                                      Text("Set your gadget delivery address",
                                          style: inter12Gray5()),
                                      const SizedBox(height: 4),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text("Address: ",
                                                style: inter14BoldBlack2()),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Text(
                                                "Green Mansion Juanda 2 Safir J-05, Sidoarjo, Jawa Timur",
                                                style: inter14MediumBlack2()),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: SvgPicture.asset(
                                    "${iconsAccountPath}payment.svg"),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Payment", style: inter14Bold()),
                                      const SizedBox(height: 4),
                                      Text("Set how you make payments",
                                          style: inter12Gray5()),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text("Payment: ",
                                                style: inter14BoldBlack2()),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Text("Gopay",
                                                style: inter14MediumBlack2()),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(height: 12.h, color: white),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  refresh() async {}

  onChangedSearch(String val) {
    searchResult.clear();
    searchValue = val;
    if (val != "") {
      // searchResult = kp.getKategoriList
      //     .where((item) => item.nama.toLowerCase().contains(searchValue))
      //     .toList();
    }
    setState(() {});
  }

  Widget colorBox(
      {required int bgColor,
      required int mainColor,
      required String imageName,
      required String name,
      Function()? onClick}) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 72,
        height: 72,
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(bgColor),
        ),
        child: Column(
          children: <Widget>[
            SvgPicture.asset("$iconsPath$imageName"),
            const SizedBox(height: 4),
            Flexible(
              child: Text(
                name,
                style: TextStyle(
                    color: Color(mainColor),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    overflow: TextOverflow.fade),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageBox(
      {required double borderRadius,
      double? height,
      double? width,
      required String imagePath}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }

  Widget cardProduct(
      {required String imageName,
      required String price,
      required String productName,
      Function()? onClick}) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: 155,
        margin: const EdgeInsets.only(top: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 4,
              color: Color.fromRGBO(0, 0, 0, 0.25),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 12,
              child: SizedBox(
                width: 131,
                height: 145,
                child: Image.asset(
                  '$productsPath$imageName',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
                flex: 3,
                child: Text(productName + "aaaaaaaaaaaaaaaa",
                    style: inter12MediumBlack())),
            const SizedBox(height: 8),
            Expanded(flex: 3, child: Text(price, style: inter14Bold())),
          ],
        ),
      ),
    );
  }

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
      height: 155,
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
              style: textColor == null ? inter14Bold() : inter14BoldWhite()),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: black3, borderRadius: BorderRadius.circular(8)),
            child:
                Text("Join priority member", style: inter12BoldActiveYellow()),
          )
        ],
      ),
    );
  }

  Widget iconBox(
      {required String name, required String iconName, Function()? onClick}) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 6, top: 16),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border.all(color: primaryBlue),
                borderRadius: BorderRadius.circular(8)),
            child: SvgPicture.asset("$iconsAccountPath$iconName",
                width: 36, height: 36),
          ),
          Text(name, style: inter12()),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_gadget/library/convert_currency.dart';
import 'package:planet_gadget/library/textstyle.dart';
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
                          const SizedBox(width: 20),
                          Expanded(
                              flex: 7,
                              child:
                                  Text("Account", style: inter20BoldWhite())),
                          Expanded(
                            flex: 2,
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
                                    onTap: () => Navigator.pop(context),
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
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("My Purchases", style: inter16Bold()),
                                Text("Purchase history", style: inter12Black2())
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 141,
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 20),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return imageBox(
                                    width: 233,
                                    height: 131,
                                    borderRadius: 12,
                                    imagePath: "${bannerPath}promo.png");
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemCount: 3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Special for members only",
                                    style: inter16Bold()),
                                InkWell(
                                    onTap: () {},
                                    child: Text("See More",
                                        style: inter12MediumBlack())),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 258,
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 28),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return imageBox(
                                    width: 175,
                                    height: 248,
                                    borderRadius: 12,
                                    imagePath: "${bannerPath}promo3.jpg");
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemCount: 3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Preferred brands", style: inter16Bold()),
                                InkWell(
                                    onTap: () {},
                                    child: Text("See More",
                                        style: inter12MediumBlack())),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 80,
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 28),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return imageBox(
                                    width: 120,
                                    height: 60,
                                    borderRadius: 12,
                                    imagePath: "${merekPath}asus.png");
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemCount: 3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Choice for you", style: inter16Bold()),
                                InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChoiceForYouPage())),
                                    child: Text("See More",
                                        style: inter12MediumBlack())),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 251,
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 32),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return cardProduct(
                                    imageName:
                                        "iphone_12_mini_blue_1_1_5_2 1.png",
                                    price: convertToIdr(nominal: "12999000"),
                                    productName: "Apple Iphone 12 128Gb",
                                    onClick: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProductPage()));
                                    });
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemCount: 5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("New product", style: inter16Bold()),
                                InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChoiceForYouPage())),
                                    child: Text("See More",
                                        style: inter12MediumBlack())),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 251,
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 32),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return cardProduct(
                                    imageName:
                                        "iphone_12_mini_blue_1_1_5_2 1.png",
                                    price: convertToIdr(nominal: "12999000"),
                                    productName: "Apple Iphone 12 128Gb",
                                    onClick: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const NewProductPage()));
                                    });
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemCount: 5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Best selling product",
                                    style: inter16Bold()),
                                InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BestSeliingProductPage())),
                                    child: Text("See More",
                                        style: inter12MediumBlack())),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 251,
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 32),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return cardProduct(
                                    imageName:
                                        "iphone_12_mini_blue_1_1_5_2 1.png",
                                    price: convertToIdr(nominal: "12999000"),
                                    productName: "Apple Iphone 12 128Gb",
                                    onClick: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProductPage()));
                                    });
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemCount: 5,
                            ),
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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: black3, borderRadius: BorderRadius.circular(8)),
            child:
                Text("Join priority member", style: inter12BoldActiveYellow()),
          )
        ],
      ),
    );
  }
}

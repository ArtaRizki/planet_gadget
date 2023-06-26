import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_gadget/library/textstyle.dart';
import 'package:planet_gadget/utils/constants/path.dart';
import 'package:sizer/sizer.dart';

import '../../../library/color.dart';
import '../../../library/convert_currency.dart';
import '../../../library/decoration.dart';
import '../../../library/toast.dart';
import '../../../main.dart';
import '../../core/appbar_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'information_store/information_store_page.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  TextEditingController reviewC = TextEditingController();
  String reviewValue = "";
  List reviewResult = [];
  DraggableScrollableController dragC = DraggableScrollableController();
  DraggableScrollableController refundC = DraggableScrollableController();
  DraggableScrollableController receivedC = DraggableScrollableController();
  DraggableScrollableController thankyouC = DraggableScrollableController();
  DraggableScrollableController rateReviewC = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: DefaultTabController(
        length: 3,
        child: Builder(builder: (context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              if (tabController.index == 0) {
                // paketProvider.setContainerHeight =
                //     (MediaQuery.of(context).size.height +
                //         (MediaQuery.of(context).size.height * .12));
              }
              if (tabController.index == 1) {
                // paketProvider.containerHeightAddDetailPaket();
              }
            }
          });
          return Scaffold(
            appBar: appBarWidget(title: "Article", context: context),
            backgroundColor: white,
            body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: RefreshIndicator(
                onRefresh: () {
                  return refresh();
                },
                child: Column(
                  children: <Widget>[
                    TabBar(
                      controller: tabController,
                      isScrollable: true,
                      labelColor: black,
                      indicatorColor: activeBgColor,
                      indicatorWeight: 5,
                      unselectedLabelColor: black,
                      tabs: const <Tab>[
                        Tab(text: "Information Store"),
                        Tab(text: "News"),
                        Tab(text: "Tips & Tricks"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          productTabbarView(
                              productTabbarItem: informationStoreItem(
                            imageName: "information_store.jpg",
                            title: "Information Holiday",
                            date: "2023-06-22",
                            description:
                                "In the letter issued on October 11, 2022, the schedule for the Eid Al-Fitr national holiday for April 22-23, 2023 is accompanied by a joint leave schedule covering April 21, 24, 25, and 26, 2023.",
                          )),
                          productTabbarView(productTabbarItem: newsItem()),
                          productTabbarView(
                              productTabbarItem: tipsTricksItem()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  refresh() async {}

  Widget completed() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return;
        },
        separatorBuilder: (context, index) => const SizedBox(height: 4),
        itemCount: 4);
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
        color: white,
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }

  Widget productTabbarView({required Widget productTabbarItem}) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: ((context, animation, secondaryAnimation) =>
                  const InformationStorePage()),
              transitionDuration: const Duration(seconds: 0),
              reverseTransitionDuration: Duration.zero)),
      // onTap: routes.navigateTo(context, page: const InformationStorePage()),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => productTabbarItem,
            separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Divider(color: grayBorder, thickness: 1)),
            itemCount: 2),
      ),
    );
  }

  Widget newsItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Order ID", style: inter14Bold()),
            Text("230512GFG29TN5 ", style: inter14Bold()),
          ],
        ),
        // const SizedBox(height: 16),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: imageBox(
                  borderRadius: 0,
                  width: 80,
                  height: 80,
                  imagePath:
                      "${productsPath}iphone_12_mini_blue_1_1_5_2 1.png"),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 24),
                  Text("Apple Iphone 12 128Gb", style: inter14MediumBlack2()),
                  const SizedBox(height: 8),
                  Text("Variant: Blue", style: inter12MediumBlack2()),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(convertToIdr(nominal: "12999000"),
                          style: inter14Bold()),
                      Text(
                        "(1 Item)",
                        style: inter12MediumBlack2(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Order Total : ", style: inter12MediumBlack2()),
                      Text(convertToIdr(nominal: "13019000"),
                          style: inter12BoldBlack())
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text("Packing Time 01-06-2023", style: inter12MediumBlack2()),
        )
      ],
    );
  }

  Widget tipsTricksItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Order ID", style: inter14Bold()),
            Text("230512GFG29TN5 ", style: inter14Bold()),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: imageBox(
                  borderRadius: 0,
                  width: 80,
                  height: 80,
                  imagePath:
                      "${productsPath}iphone_12_mini_blue_1_1_5_2 1.png"),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 24),
                  Text("Apple Iphone 12 128Gb", style: inter14MediumBlack2()),
                  const SizedBox(height: 8),
                  Text("Variant: Blue", style: inter12MediumBlack2()),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(convertToIdr(nominal: "12999000"),
                          style: inter14Bold()),
                      Text(
                        "(1 Item)",
                        style: inter12MediumBlack2(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Order Total : ", style: inter12MediumBlack2()),
                      Text(convertToIdr(nominal: "13019000"),
                          style: inter12BoldBlack())
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child:
              Text("Completed Time 01-06-2023", style: inter12MediumBlack2()),
        ),
        InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ArticlePage())),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: primaryBlue,
              border: Border.all(color: primaryBlue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("View Delivery Details", style: inter16BoldWhite()),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget productCompletedItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Order ID", style: inter14Bold()),
            Text("230512GFG29TN5 ", style: inter14Bold()),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: imageBox(
                  borderRadius: 0,
                  width: 80,
                  height: 80,
                  imagePath:
                      "${productsPath}iphone_12_mini_blue_1_1_5_2 1.png"),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 24),
                  Text("Apple Iphone 12 128Gb", style: inter14MediumBlack2()),
                  const SizedBox(height: 8),
                  Text("Variant: Blue", style: inter12MediumBlack2()),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(convertToIdr(nominal: "12999000"),
                          style: inter14Bold()),
                      Text(
                        "(1 Item)",
                        style: inter12MediumBlack2(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Order Total : ", style: inter12MediumBlack2()),
                      Text(convertToIdr(nominal: "13019000"),
                          style: inter12BoldBlack())
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child:
              Text("Completed Time 01-06-2023", style: inter12MediumBlack2()),
        ),
        InkWell(
          onTap: rateAndReviewSheet,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: primaryBlue,
              border: Border.all(color: primaryBlue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Rate", style: inter16BoldWhite()),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget productArrivedItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Order ID", style: inter14Bold()),
            Text("230512GFG29TN5 ", style: inter14Bold()),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: imageBox(
                  borderRadius: 0,
                  width: 80,
                  height: 80,
                  imagePath:
                      "${productsPath}iphone_12_mini_blue_1_1_5_2 1.png"),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 24),
                  Text("Apple Iphone 12 128Gb", style: inter14MediumBlack2()),
                  const SizedBox(height: 8),
                  Text("Variant: Blue", style: inter12MediumBlack2()),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(convertToIdr(nominal: "12999000"),
                          style: inter14Bold()),
                      Text(
                        "(1 Item)",
                        style: inter12MediumBlack2(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Order Total : ", style: inter12MediumBlack2()),
                      Text(convertToIdr(nominal: "13019000"),
                          style: inter12BoldBlack())
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child:
              Text("Completed Time 01-06-2023", style: inter12MediumBlack2()),
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: InkWell(
                onTap: refundSheet,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: primaryBlue, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Refund", style: inter16Bold()),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 5,
              child: InkWell(
                onTap: receivedSheet,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: primaryBlue,
                    border: Border.all(color: primaryBlue, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Received", style: inter16BoldWhite()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget productCancelledItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Order ID", style: inter14Bold()),
            Text("230512GFG29TN5 ", style: inter14Bold()),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: imageBox(
                  borderRadius: 0,
                  width: 80,
                  height: 80,
                  imagePath:
                      "${productsPath}iphone_12_mini_blue_1_1_5_2 1.png"),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 24),
                  Text("Apple Iphone 12 128Gb", style: inter14MediumBlack2()),
                  const SizedBox(height: 8),
                  Text("Variant: Blue", style: inter12MediumBlack2()),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(convertToIdr(nominal: "12999000"),
                          style: inter14Bold()),
                      Text(
                        "(1 Item)",
                        style: inter12MediumBlack2(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Order Total : ", style: inter12MediumBlack2()),
                      Text(convertToIdr(nominal: "13019000"),
                          style: inter12BoldBlack())
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child:
              Text("Completed Time 01-06-2023", style: inter12MediumBlack2()),
        ),
        InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ArticlePage())),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: primaryBlue,
              border: Border.all(color: primaryBlue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Buy Again", style: inter16BoldWhite()),
              ],
            ),
          ),
        )
      ],
    );
  }

  refundSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          controller: refundC,
          initialChildSize: 0.4,
          minChildSize: 0.1,
          maxChildSize: 0.96,
          expand: false,
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(color: Color(0xfff8faf7)),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 8),
                              color: activeBgColor,
                              width: 100,
                              height: 4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Listview (list of data with check box for multiple selection & on tile tap single selection)
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text("You are about to request a refund",
                                style: inter16Bold()),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Text(
                              "Remember, this will cancel your order. Are you sure you want to proceed?",
                              style: inter14Black2(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    afterChangeDoubleButton(
                      name1: "Yes, Proceed with Refund",
                      name2: "No, Keep My Order",
                      onClick1: () {
                        thankyouSheet(
                            text:
                                "Thank you for confirming. Your refund process is now initiated. Expect funds to be returned to your account within 3-5 business days");
                        // Navigator.pop(context);
                      },
                      onClick2: () {
                        thankyouSheet(
                            text:
                                "Great, your order remains active! If you need further assistance, feel free to contact our customer service. We're here to help!");
                        // Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  receivedSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          controller: receivedC,
          initialChildSize: 0.4,
          minChildSize: 0.1,
          maxChildSize: 0.96,
          expand: false,
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(color: Color(0xfff8faf7)),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 8),
                              color: activeBgColor,
                              width: 100,
                              height: 4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Listview (list of data with check box for multiple selection & on tile tap single selection)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            "you are confirming that you have physically received your ordered item(s). Please confirm only if you've thoroughly checked the product. Do you want to proceed?",
                            style: inter14Black2(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    afterChangeDoubleButton(
                      name1: "Yes, I will process this",
                      name2: "No, I will double check the product",
                      onClick1: () {
                        thankyouSheet(
                            text:
                                "Thank you for confirming the receipt. We hope you enjoy your product. Don't forget to leave a review!");
                        // Navigator.pop(context);
                      },
                      onClick2: () {
                        thankyouSheet(
                            text:
                                "Alright, please check your item more thoroughly. If you have any questions or issues, feel free to contact our customer service");
                        // Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  rateAndReviewSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          controller: rateReviewC,
          initialChildSize: 0.6,
          minChildSize: 0.6,
          maxChildSize: 0.96,
          expand: false,
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(color: Color(0xfff8faf7)),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 8),
                              color: activeBgColor,
                              width: 100,
                              height: 4,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 24.0,
                                bottom: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /// Bottom sheet title text
                                Text("Rate and Review", style: inter20Bold()),
                                InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: const Icon(Icons.close)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Listview (list of data with check box for multiple selection & on tile tap single selection)
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        // crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: imageBox(
                                      borderRadius: 0,
                                      width: 80,
                                      height: 80,
                                      imagePath:
                                          "${productsPath}iphone_12_mini_blue_1_1_5_2 1.png"),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  flex: 7,
                                  child: Text("Apple Iphone 12 128Gb",
                                      style: inter16Bold()),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Center(
                            child: RatingBar(
                              initialRating: 3,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full:
                                    Icon(Icons.star, color: activeYellowColor),
                                half:
                                    Icon(Icons.star, color: activeYellowColor),
                                empty: Icon(Icons.star_border,
                                    color: activeYellowColor),
                              ),
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 5.w),
                              onRatingUpdate: (rating) {
                                log("RATING : $rating");
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Review", style: inter14Medium()),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              // autofocus: true,
                              controller: reviewC,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onChanged: (val) => onChangedReview(val),
                              style: inter14Medium(),
                              cursorColor: primaryBlue,
                              decoration:
                                  generalDecoration("Enter Recipient", ""),
                              scrollPadding: const EdgeInsets.only(bottom: 52),
                            ),
                          )
                        ],
                      ),
                    ),
                    afterChangeButton(
                        name: "Confirm",
                        onClick: () => showToast(
                            "Thank you for your rating and review! We appreciate your feedback.",
                            context)),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  thankyouSheet({required String text}) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          controller: thankyouC,
          initialChildSize: 0.25,
          minChildSize: 0.1,
          maxChildSize: 0.96,
          expand: false,
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration:
                            const BoxDecoration(color: Color(0xfff8faf7)),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 8),
                                color: activeBgColor,
                                width: 100,
                                height: 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(
                            child: Text(
                          text,
                          style: inter14Black2(),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget afterChangeButton({required String name, Function()? onClick}) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 16)),
            // shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            fixedSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 52)),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            backgroundColor: MaterialStateProperty.all(primaryBlue)),
        onPressed: onClick,
        child: Text(
          name,
          style: inter16BoldWhite(),
        ),
      ),
    );
  }

  Widget afterChangeDoubleButton(
      {required String name1,
      required String name2,
      Function()? onClick1,
      Function()? onClick2}) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 16)),
                // shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 52)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
                backgroundColor: MaterialStateProperty.all(primaryBlue)),
            onPressed: onClick1,
            child: Text(
              name1,
              style: inter16BoldWhite(),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 16)),
                // shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 52)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side: BorderSide(color: primaryBlue),
                    borderRadius: BorderRadius.circular(8))),
                backgroundColor: MaterialStateProperty.all(white)),
            onPressed: onClick2,
            child: Text(
              name2,
              style: inter16Bold(),
            ),
          )
        ],
      ),
    );
  }

  onChangedReview(String val) {
    reviewResult.clear();
    reviewValue = val;
    if (val != "") {
      // searchResult = kp.getKategoriList
      //     .where((item) => item.nama.toLowerCase().contains(searchValue))
      //     .toList();
    }
    setState(() {});
  }

  Future<dynamic> filterModalBottom(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 4,
                  width: 0.27.w,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Color(0xffd3d5d6),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filter',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xff0084CE),
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text("AAAA"),
                  const Text("AAAA"),
                  const Text("AAAA"),
                  const Text("AAAA"),
                  const Text("AAAA"),
                  const Text("AAAA"),
                  const Text("AAAA"),
                  const Text("AAAA"),
                  const Text("AAAA"),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("TERAPKAN")],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget informationStoreItem(
      {required imageName,
      required title,
      required date,
      required description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: imageBox(
              borderRadius: 8,
              width: 100,
              height: 100,
              imagePath: "$articlePath$imageName"),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: inter16Bold()),
              const SizedBox(height: 4),
              Row(
                children: <Widget>[
                  SvgPicture.asset("${iconsArticlePath}clock.svg"),
                  const SizedBox(width: 4),
                  Text(date, style: inter12Black2()),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: inter14MediumBlack2(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planet_gadget/library/textstyle.dart';
import 'package:planet_gadget/utils/constants/path.dart';

import '../../../library/color.dart';
import '../../../library/convert_currency.dart';
import '../../../library/decoration.dart';
import '../../../library/toast.dart';
import '../../core/appbar_widget.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  TextEditingController reviewC = TextEditingController();
  String reviewValue = "";
  List reviewResult = [];
  DraggableScrollableController dragC = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: DefaultTabController(
        length: 6,
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
            appBar: appBarWidget(title: "My Purchases", context: context),
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
                        Tab(text: "To Pay"),
                        Tab(text: "Packing"),
                        Tab(text: "Delivery"),
                        Tab(text: "Arrived"),
                        Tab(text: "Completed"),
                        Tab(text: "Cancelled"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          productTabbarView(
                              productTabbarItem: productToPayItem()),
                          productTabbarView(
                              productTabbarItem: productPackingItem()),
                          productTabbarView(
                              productTabbarItem: productDeliveryItem()),
                          productTabbarView(
                              productTabbarItem: productArrivedItem()),
                          productTabbarView(
                              productTabbarItem: productCompletedItem()),
                          productTabbarView(
                              productTabbarItem: productCancelledItem()),
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
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => productTabbarItem,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: 2),
    );
  }

  Widget productToPayItem() {
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
              MaterialPageRoute(builder: (context) => const PurchasePage())),
          child: Row(
            children: [
              Expanded(
                flex: 5,
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
                      Text("Cancel", style: inter16Bold()),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
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
                      Text("Pay Now", style: inter16BoldWhite()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget productPackingItem() {
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

  Widget productDeliveryItem() {
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
              MaterialPageRoute(builder: (context) => const PurchasePage())),
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
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PurchasePage())),
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
            InkWell(
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
            InkWell(
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
              MaterialPageRoute(builder: (context) => const PurchasePage())),
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
          controller: dragC,
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
                            padding: const EdgeInsets.all(20),
                            child: Text(
                                "Remember, this will cancel your order. Are you sure you want to proceed?",
                                style: inter14Black2()),
                          ),
                          const SizedBox(height: 16),
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
                        Navigator.pop(context);
                      },
                      onClick2: () {
                        thankyouSheet(
                            text:
                                "Great, your order remains active! If you need further assistance, feel free to contact our customer service. We're here to help!");
                        Navigator.pop(context);
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
          controller: dragC,
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
                            child: Text(
                                "you are confirming that you have physically received your ordered item(s). Please confirm only if you've thoroughly checked the product. Do you want to proceed?",
                                style: inter14Black2()),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    afterChangeDoubleButton(
                      name1: "Yes, I will process this",
                      name2: "No, I will double check the product",
                      onClick1: () {
                        thankyouSheet(
                            text:
                                "Thank you for confirming the receipt. We hope you enjoy your product. Don't forget to leave a review!");
                        Navigator.pop(context);
                      },
                      onClick2: () {
                        thankyouSheet(
                            text:
                                "Alright, please check your item more thoroughly. If you have any questions or issues, feel free to contact our customer service");
                        Navigator.pop(context);
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
          controller: dragC,
          initialChildSize: 0.5,
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
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 24.0,
                                bottom: 12.0),
                            child: Row(
                              children: [
                                /// Bottom sheet title text
                                Expanded(
                                    flex: 5,
                                    child: Text("Rate and Review",
                                        style: inter20Bold())),
                                Expanded(
                                  flex: 5,
                                  child: InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: const Icon(Icons.close)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Listview (list of data with check box for multiple selection & on tile tap single selection)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
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
                                      style: inter14MediumBlack2()),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          //BINTANG
                          const SizedBox(height: 12),
                          Text("Review", style: inter14Medium()),
                          const SizedBox(height: 8),
                          TextFormField(
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
          controller: dragC,
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
                    Expanded(
                      child: Text(text, style: inter14Black2()),
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
}

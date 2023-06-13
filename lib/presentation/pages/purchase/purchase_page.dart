import 'package:flutter/material.dart';
import 'package:planet_gadget/library/textstyle.dart';
import 'package:planet_gadget/utils/constants/path.dart';

import '../../../library/color.dart';
import '../../../library/convert_currency.dart';
import '../../core/appbar_widget.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
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
                          const Text("ASU"),
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return productPackingItem();
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 16),
                                itemCount: 2),
                          ),
                          const Text("ASU"),
                          const Text("ASU"),
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return productCompletedItem();
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 16),
                                itemCount: 2),
                          ),
                          const Text("ASU"),
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
                Text("Rate", style: inter16Bold()),
              ],
            ),
          ),
        )
      ],
    );
  }
}

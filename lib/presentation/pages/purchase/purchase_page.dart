import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planet_gadget/library/textstyle.dart';
import 'package:planet_gadget/utils/constants/path.dart';
import 'package:sizer/sizer.dart';

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
          final TabController tabController = DefaultTabController.of(context)!;
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
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return productItem();
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 16),
                                itemCount: 2),
                          ),
                          const Text("ASU"),
                          const Text("ASU"),
                          const Text("ASU"),
                          const Text("ASU"),
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

  Widget productItem() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Order ID", style: inter14Bold()),
            Text("230512GFG29TN5 ", style: inter14Bold()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: <Widget>[
            imageBox(
                borderRadius: 0,
                width: 80,
                height: 80,
                imagePath: "${productsPath}iphone_12_mini_blue_1_1_5_2 1.png"),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Apple Iphone 12 128Gb", style: inter14MediumBlack2()),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: tertiaryYellow,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text("Variant: Blue", style: inter12MediumBlack2()),
                        // const SizedBox(width: 4),
                        Icon(Icons.keyboard_arrow_down_rounded, color: black)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(convertToIdr(nominal: "12999000"), style: inter14Bold()),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child:
                        SvgPicture.asset("${iconsPath}trash.svg", color: red),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: activeBgColor),
                      borderRadius: BorderRadius.circular(8),
                      color: white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: disabledBgColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: SvgPicture.asset("${iconsPath}minus.svg",
                              color: disabledTextColor),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "1",
                          style: inter14MediumBlack2(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: activeBgColor,
                          child: SvgPicture.asset("${iconsPath}plus.svg",
                              color: black),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

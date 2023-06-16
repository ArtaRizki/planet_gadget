import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../library/color.dart';
import '../../../library/convert_currency.dart';
import '../../../library/textstyle.dart';
import '../../../utils/constants/path.dart';
import '../../core/appbar_widget.dart';
import '../payment/payment_page.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  DraggableScrollableController dragC = DraggableScrollableController();
  bool redeem = false;
  bool address1 = false;
  String address1Value = "Address 1";
  String shipping1Value = "JNE";
  String payment1Value = "Gopay";
  bool address2 = false;
  String address2Value = "Address 2";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        appBar: appBarWidget(title: "Checkout", context: context),
        bottomNavigationBar: bottomButton(),
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                                "${iconsCheckoutPath}delivery_address.svg",
                                width: 24,
                                height: 24),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Delivery Address",
                                        style: inter14Bold()),
                                    InkWell(
                                      onTap: () => addressSheet(),
                                      child: Text("Change address",
                                          style: inter12Black2()),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text("Yoshua", style: inter12BoldBlack2()),
                                    const SizedBox(width: 4),
                                    Text("0822334449460",
                                        style: inter12MediumBlack2()),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                    "Green Mansion Juanda 2 Safir J-05, Sidoarjo, Jawa Timur",
                                    style: inter14MediumBlack2()),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
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
                                Text("Apple Iphone 12 128Gb",
                                    style: inter14MediumBlack2()),
                                const SizedBox(height: 8),
                                Text("Variant: Blue",
                                    style: inter12MediumBlack2()),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              ],
                            ),
                          ),
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
                                Text("Apple Iphone 12 128Gb",
                                    style: inter14MediumBlack2()),
                                const SizedBox(height: 8),
                                Text("Variant: Blue",
                                    style: inter12MediumBlack2()),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(convertToIdr(nominal: "12999000"),
                                        style: inter14Bold()),
                                    Text(
                                      "(2 Item)",
                                      style: inter12MediumBlack2(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Shipping Option", style: inter16Bold()),
                          InkWell(
                              onTap: () => shippingSheet(),
                              child: Text("Change shipping",
                                  style: inter12Black2())),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(thickness: 1, color: black3),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(
                                "${iconsCheckoutPath}shipping.svg",
                                width: 40,
                                height: 40),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("JNE", style: inter14Bold()),
                                      const SizedBox(height: 2),
                                      Text("Reguler", style: inter12Black2()),
                                      const SizedBox(height: 2),
                                      Text("Estimated arrival on 14 - 19 May",
                                          style: inter12Black2())
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(convertToIdr(nominal: "20000"),
                                    style: inter12BoldBlack()),
                              ))
                        ],
                      ),
                      const SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Payment Option", style: inter16Bold()),
                          InkWell(
                              onTap: () => paymentSheet(),
                              child: Text("Change payment",
                                  style: inter12Black2())),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(thickness: 1, color: black3),
                      ),
                      Text("Instant Payment", style: inter14Bold()),
                      const SizedBox(height: 4),
                      Text("Bank Transfer", style: inter14Black2()),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Redeem 100 coin", style: inter14Medium()),
                          Theme(
                            data: ThemeData(useMaterial3: true).copyWith(
                                colorScheme: Theme.of(context)
                                    .colorScheme
                                    .copyWith(outline: primaryBlue)),
                            child: Switch(
                              activeColor: white,
                              activeTrackColor: primaryBlue,
                              // inactiveThumbColor: Colors.blueGrey.shade600,
                              // inactiveTrackColor: Colors.grey.shade400,
                              splashRadius: 50.0,
                              value: redeem,
                              // changes the state of the switch
                              onChanged: (value) =>
                                  setState(() => redeem = value),
                            ),
                          ),
                          //toggle
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SvgPicture.asset(
                              "${iconsCheckoutPath}payment_detail.svg"),
                          const SizedBox(width: 4),
                          Text("Payment detail", style: inter16Bold()),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(thickness: 1, color: black3),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Merchandise Subtotal",
                              style: inter14MediumBlack2()),
                          Text(convertToIdr(nominal: "38997000"),
                              style: inter14BoldBlack2()),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Shipping Subtotal",
                              style: inter14MediumBlack2()),
                          Text(convertToIdr(nominal: "20000"),
                              style: inter14BoldBlack2()),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Total Payment", style: inter14Bold()),
                          Text(convertToIdr(nominal: "39017000"),
                              style: inter14Bold()),
                        ],
                      ),
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

  Widget bottomButton() {
    return Container(
      decoration: BoxDecoration(
        color: white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(0, 0),
            color: black25,
            blurRadius: 4,
          )
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Total Payment", style: inter14MediumBlack2()),
                    const SizedBox(height: 12),
                    Text(convertToIdr(nominal: "12999000"),
                        style: inter16Bold()),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentPage())),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryBlue),
                        borderRadius: BorderRadius.circular(8),
                        color: primaryBlue),
                    child:
                        Center(child: Text("Pay", style: inter16BoldWhite())),
                  ),
                ),
              ),
            ],
          ),
        ],
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
        color: white,
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }

  void shippingSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
            controller: dragC,
            // initialChildSize: iconItems != null && (0.109 * iconItems!.length) < 1
            //     ? 0.109 * iconItems!.length
            //     : 0.96,
            initialChildSize: 0.45,
            minChildSize: 0.45,
            maxChildSize: 0.96,
            expand: false,
            snap: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return StatefulBuilder(builder: (context, setState) {
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /// Bottom sheet title text
                                Expanded(
                                    child: Text("Shipping Option",
                                        style: inter28Bold())),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      Navigator.of(context).pop(null);
                                    },
                                    child: const Icon(Icons.close),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Listview (list of data with check box for multiple selection & on tile tap single selection)
                    Expanded(
                      child: SizedBox(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return shippingBox(
                                borderRadius: 12,
                                width: 178,
                                imagePath: "jne.png",
                                groupValue: shipping1Value,
                                value: shipping1Value);
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 12),
                          itemCount: 3,
                        ),
                      ),
                    ),
                    afterChangeButton(name: "Apply"),
                  ],
                );
              });
            },
          );
        });
  }

  void paymentSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
            controller: dragC,
            // initialChildSize: iconItems != null && (0.109 * iconItems!.length) < 1
            //     ? 0.109 * iconItems!.length
            //     : 0.96,
            initialChildSize: 0.45,
            minChildSize: 0.45,
            maxChildSize: 0.96,
            expand: false,
            snap: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return StatefulBuilder(builder: (context, setState) {
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /// Bottom sheet title text
                                Expanded(
                                    child: Text("Payment List",
                                        style: inter28Bold())),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      Navigator.of(context).pop(null);
                                    },
                                    child: const Icon(Icons.close),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Listview (list of data with check box for multiple selection & on tile tap single selection)
                    Expanded(
                      child: SizedBox(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return paymentBox(
                                borderRadius: 12,
                                width: 178,
                                imagePath: "gopay.png",
                                groupValue: payment1Value,
                                value: payment1Value);
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 12),
                          itemCount: 3,
                        ),
                      ),
                    ),
                    afterChangeButton(name: "Apply"),
                  ],
                );
              });
            },
          );
        });
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
        onPressed: () async => onClick ?? {},
        child: Text(
          name,
          style: inter16BoldWhite(),
        ),
      ),
    );
  }

  Widget shippingBox({
    required double borderRadius,
    double? height,
    double? width,
    required String imagePath,
    required String? groupValue,
    required String? value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: secondaryBlue,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Radio(
              fillColor: MaterialStateProperty.all(primaryBlue),
              groupValue: groupValue,
              value: value,
              onChanged: (val) => setState(() => value = val.toString()),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("JNE Regular", style: inter14Bold()),
                const SizedBox(height: 4),
                Image.asset("$shippingPath$imagePath"),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentBox({
    required double borderRadius,
    double? height,
    double? width,
    required String imagePath,
    required String? groupValue,
    required String? value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: secondaryBlue,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Radio(
              fillColor: MaterialStateProperty.all(primaryBlue),
              groupValue: groupValue,
              value: value,
              onChanged: (val) => setState(() => value = val.toString()),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Gopay", style: inter14Bold()),
                const SizedBox(height: 4),
                Image.asset("$iconsCheckoutPath$imagePath"),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  addressSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          controller: dragC,
          initialChildSize: 0.46,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /// Bottom sheet title text
                                Expanded(
                                    child: Text("Address List",
                                        style: inter28Bold())),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      Navigator.of(context).pop(null);
                                    },
                                    child: const Icon(Icons.close),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Listview (list of data with check box for multiple selection & on tile tap single selection)
                    Expanded(
                      child: SizedBox(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(20),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (index == 1) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                decoration: BoxDecoration(
                                  color: primaryYellow,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: 8),
                                    SvgPicture.asset(
                                        "${iconsCheckoutPath}add_address.svg"),
                                    const SizedBox(height: 16),
                                    Text("Add Address", style: inter14Medium()),
                                  ],
                                ),
                              );
                            }
                            return addressBox(
                              value: address1Value,
                              groupValue: address1Value,
                              addressName: "Office/Home",
                              name: "Yoshua",
                              phone: "0822334449460",
                              address:
                                  "Green Mansion Juanda 2 Safir J-05, Sidoarjo, Jawa Timur",
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemCount: 2,
                        ),
                      ),
                    ),
                    afterChangeButton(name: "Apply"),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Widget addressBox(
      {required String? groupValue,
      required String value,
      required String addressName,
      required String name,
      required String phone,
      required String address}) {
    return Container(
      // height: 98,
      width: 90.w,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: secondaryBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Radio(
              fillColor: MaterialStateProperty.all(primaryBlue),
              groupValue: groupValue,
              value: value,
              onChanged: (val) => setState(() => value = val.toString()),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(addressName, style: inter14Bold()),
                const SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text("Name", style: inter12BoldBlack2()),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(": $name", style: inter12MediumBlack2()),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text("Phone", style: inter12BoldBlack2()),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(": $phone", style: inter12MediumBlack2()),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text("Address", style: inter12BoldBlack2()),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(": $redeem", style: inter12MediumBlack2()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

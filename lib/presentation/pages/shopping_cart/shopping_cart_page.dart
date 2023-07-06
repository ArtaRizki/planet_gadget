import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_gadget/presentation/pages/checkout/checkout_page.dart';
import 'package:sizer/sizer.dart';

import '../../../application/account/account_address_notifier.dart';
import '../../../application/account/account_address_state.dart';
import '../../../domain/entity/core/address_model.dart';
import '../../../library/color.dart';
import '../../../library/convert_currency.dart';
import '../../../library/textstyle.dart';
import '../../../library/toast.dart';
import '../../../utils/constants/path.dart';
import '../../core/appbar_widget.dart';
import '../account/widgets/field.dart';
import '../payment/payment_page.dart';

class ShoppingCartPage extends StatefulWidget {
  ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  TextEditingController recipientC = TextEditingController(),
      phoneNumberC = TextEditingController(),
      addressC = TextEditingController();
  DraggableScrollableController dragC = DraggableScrollableController();
  DraggableScrollableController addressListC = DraggableScrollableController();
  DraggableScrollableController addAddressC = DraggableScrollableController();
  DraggableScrollableController addAddressCloseConfirmC =
      DraggableScrollableController();
  DraggableScrollableController editAddressC = DraggableScrollableController();
  DraggableScrollableController editAddressConfirmC =
      DraggableScrollableController();
  DraggableScrollableController editAddressCloseConfirmC =
      DraggableScrollableController();
  DraggableScrollableController deleteAddressConfirmC =
      DraggableScrollableController();
  bool redeem = false;
  bool address1 = false;
  String address1Value = "Yoshua";
  String address2Value = "Address 2";
  String payment1Value = "Transfer Bank";
  TextEditingController searchC = TextEditingController();
  String searchValue = "";
  List searchResult = [];
  bool home = true;
  String shipping1Value = "JNE";
  bool address2 = false;

  List<AddressModel> addressList = [
    const AddressModel(
      label: "Home",
      name: "Yoshua",
      phoneNumber: "0822334449460",
      completeAddress: """Green Mansion Juanda 2 Safir J-05,
        Sidoarjo, Jawa Timur""",
    ),
  ];

  bool? cbValue = false;
  bool? checkAllValue = false;
  int total = 0;
  add() => setState(() => total++);
  min() => setState(() {
        if (total > 0) {
          total--;
        }
      });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        appBar: appBarWidget(title: "Shopping Cart", context: context),
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
                                "${iconsShoppingCartPath}delivery_address.svg",
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
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: secondaryBlue,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text("Yoshua", style: inter12BoldBlack2()),
                                    const SizedBox(width: 4),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text("Phone",
                                            style: inter14MediumBlack2())),
                                    Text(": ", style: inter14MediumBlack2()),
                                    Expanded(
                                      flex: 8,
                                      child: Text("0822334449460",
                                          style: inter14MediumBlack2()),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text("Address",
                                          style: inter14MediumBlack2()),
                                    ),
                                    Text(": ", style: inter14MediumBlack2()),
                                    Expanded(
                                      flex: 8,
                                      child: Text(
                                          "Green Mansion Juanda 2 Safir J-05, Sidoarjo, Jawa Timur",
                                          style: inter14MediumBlack2()),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  side: BorderSide(color: black)),
                              fillColor: MaterialStateProperty.all(primaryBlue),
                              activeColor: white,
                              checkColor: white,
                              value: checkAllValue,
                              onChanged: ((value) {
                                setState(() => checkAllValue = value);
                              }),
                            ),
                          ),
                          // const SizedBox(width: 8),
                          Expanded(
                              flex: 9,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child:
                                    Text("Select All", style: inter14Medium()),
                              )),
                        ],
                      ),
                      Divider(thickness: 1, color: black3),
                      const SizedBox(height: 12),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  side: BorderSide(color: black)),
                              fillColor: MaterialStateProperty.all(primaryBlue),
                              activeColor: white,
                              checkColor: white,
                              value: cbValue,
                              onChanged: ((value) {
                                setState(() => cbValue = value);
                              }),
                            ),
                          ),
                          // const SizedBox(width: 24),
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
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Apple Iphone 12 128Gb",
                                    style: inter14MediumBlack2()),
                                const SizedBox(height: 8),
                                InkWell(
                                  onTap: () => variantSheet(),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: secondaryBlue,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text("Variant: Blue",
                                            style: inter12MediumBlack2()),
                                        // const SizedBox(width: 4),
                                        Icon(Icons.keyboard_arrow_down_rounded,
                                            color: black)
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(convertToIdr(nominal: "12999000"),
                                    style: inter14Bold()),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              flex: 10,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () => deleteSheet(),
                                  child: SvgPicture.asset(
                                      "${iconsPath}trash.svg",
                                      color: red),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: InkWell(
                                        onTap: min,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: activeBgColor,
                                            // color: disabledBgColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                            ),
                                          ),
                                          child: SvgPicture.asset(
                                            "${iconsPath}minus.svg",
                                            color: white,
                                            // color: disabledTextColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        "$total",
                                        style: inter14MediumBlack2(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: InkWell(
                                        onTap: add,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: activeBgColor,
                                            // color: disabledBgColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8),
                                            ),
                                          ),
                                          child: SvgPicture.asset(
                                              "${iconsPath}plus.svg",
                                              color: white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
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

  Widget afterChangeButton(
      {required String name, Function()? onClick, Color? outlineColor}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, outlineColor == null ? 16 : 0, 20, 16),
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 16)),
            // shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            fixedSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 52)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: outlineColor ?? primaryBlue))),
            backgroundColor: MaterialStateProperty.all(
                outlineColor == null ? primaryBlue : white)),
        onPressed: onClick,
        child: Text(
          name,
          style: TextStyle(
              color: outlineColor == null ? white : black,
              fontSize: 16,
              fontWeight: FontWeight.bold),
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
                Image.asset("$iconsShoppingCartPath$imagePath"),
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
          controller: addressListC,
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
                            if (index != addressList.length) {
                              final item = addressList[index];
                              return addressBox(
                                  value: item.name,
                                  groupValue: address1Value,
                                  addressName: item.label,
                                  name: item.name,
                                  phone: item.phoneNumber,
                                  address: item.completeAddress,
                                  index: index);
                            }
                            return addAddress();
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemCount: addressList.length + 1,
                        ),
                      ),
                    ),
                    afterChangeButton(
                        name: "Apply", onClick: () => Navigator.pop(context)),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Widget addAddress() {
    return InkWell(
      onTap: addAddressSheet,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: secondaryBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 8),
            SvgPicture.asset("${iconsCheckoutPath}add_address.svg"),
            const SizedBox(height: 16),
            Text("Add Address", style: inter14Medium()),
          ],
        ),
      ),
    );
  }

  addAddressSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          controller: addAddressC,
          initialChildSize: 0.82,
          minChildSize: 0.82,
          maxChildSize: 0.96,
          expand: false,
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Consumer(builder: (context, ref, child) {
                  AccountAddressState state = ref.watch(accountAddressNotifier);
                  final editAddressNotifer =
                      ref.watch(accountAddressNotifier.notifier);
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                        child: Text("Add Address",
                                            style: inter28Bold())),
                                    Expanded(
                                        flex: 5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap:
                                                  closeConfirmAddAddressSheet,
                                              child: const Icon(Icons.close),
                                            ),
                                          ],
                                        )),
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
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text("Address Labels",
                                        style: inter14Medium()),
                                    Text("*", style: inter14MediumRed()),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    addressLabel(
                                        title: "Home",
                                        value: home,
                                        onClick: () =>
                                            setState(() => home = true)),
                                    const SizedBox(width: 12),
                                    addressLabel(
                                        title: "Office",
                                        value: !home,
                                        onClick: () =>
                                            setState(() => home = false)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              fieldAddress(
                                required: true,
                                name: "Recipient's Name",
                                hint: "Recipient's Name",
                                controller: recipientC,
                                error: state.recipient.errorMessage,
                                onchanged: (val) {
                                  state = state.copyWith(
                                      recipient:
                                          state.recipient.copyWith(value: val));
                                  editAddressNotifer.checkField(
                                      val: state.recipient.value,
                                      fieldEmpty: state.recipient.isEmpty,
                                      fieldErrorMsg:
                                          state.recipient.errorMessage,
                                      errorMsg: "Nama Recepient harus diisi",
                                      type: "recipient");
                                },
                              ),
                              // const SizedBox(height: 16),
                              fieldAddress(
                                required: true,
                                name: "Mobile Phone Number",
                                hint: "Mobile Phone Number",
                                controller: phoneNumberC,
                                error: state.phoneNumber.errorMessage,
                                onchanged: (val) {
                                  state = state.copyWith(
                                      phoneNumber: state.phoneNumber
                                          .copyWith(value: val));
                                  editAddressNotifer.checkField(
                                      val: state.phoneNumber.value,
                                      fieldEmpty: state.phoneNumber.isEmpty,
                                      fieldErrorMsg:
                                          state.phoneNumber.errorMessage,
                                      errorMsg: "Nomor HP harus diisi",
                                      type: "phoneNumber");
                                },
                              ),
                              // const SizedBox(height: 16),
                              fieldAddress(
                                required: true,
                                name: "Complete Address",
                                hint: "Complete Address",
                                controller: addressC,
                                error: state.address.errorMessage,
                                onchanged: (val) {
                                  state = state.copyWith(
                                      address:
                                          state.address.copyWith(value: val));
                                  editAddressNotifer.checkField(
                                      val: state.address.value,
                                      fieldEmpty: state.address.isEmpty,
                                      fieldErrorMsg: state.address.errorMessage,
                                      errorMsg: "Alamat harus diisi",
                                      type: "address");
                                },
                              )
                            ],
                          ),
                        ),
                        afterChangeButton(
                            name: "Save",
                            onClick: () {
                              editAddressNotifer.checkField(
                                  val: state.recipient.value,
                                  fieldEmpty: state.recipient.isEmpty,
                                  fieldErrorMsg: state.recipient.errorMessage,
                                  errorMsg: "Nama Recepient harus diisi",
                                  type: "recipient");
                              editAddressNotifer.checkField(
                                  val: state.phoneNumber.value,
                                  fieldEmpty: state.phoneNumber.isEmpty,
                                  fieldErrorMsg: state.phoneNumber.errorMessage,
                                  errorMsg: "Nomor HP harus diisi",
                                  type: "phoneNumber");
                              editAddressNotifer.checkField(
                                  val: state.address.value,
                                  fieldEmpty: state.address.isEmpty,
                                  fieldErrorMsg: state.address.errorMessage,
                                  errorMsg: "Alamat harus diisi",
                                  type: "address");
                              if (state.recipient.value != "" &&
                                  state.phoneNumber.value != "" &&
                                  state.address.value != "") {
                                addressList.add(AddressModel(
                                    label: state.label,
                                    name: state.recipient.value,
                                    phoneNumber: state.phoneNumber.value,
                                    completeAddress: state.address.value));
                                setState;
                                showToast("Data saved successfully", context);
                                Navigator.of(context)
                                  ..pop()
                                  ..pop();
                              }
                            }),
                      ],
                    ),
                  );
                });
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
      required String address,
      required int index}) {
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
              onChanged: (val) => setState(() => groupValue = val.toString()),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(addressName, style: inter14Bold()),
                    // InkWell(
                    //   onTap: () => editAddressSheet(index: index),
                    //   child: SvgPicture.asset(
                    //     '${iconsAccountPath}edit.svg',
                    //     width: 15,
                    //     height: 15,
                    //   ),
                    // )
                  ],
                ),
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
                      child: Text(
                        ": $address",
                        style: inter12MediumBlack2(),
                        overflow: TextOverflow.ellipsis,
                      ),
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

  variantSheet() {
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
            initialChildSize: 0.7,
            minChildSize: 0.7,
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
                                    child:
                                        Text("Variant", style: inter28Bold())),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                imageBox(
                                    width: 80,
                                    height: 80,
                                    borderRadius: 0,
                                    imagePath:
                                        "${productsPath}iphone_12_mini_blue_1_1_5_2 1.png"),
                                const SizedBox(width: 12),
                                Text("Apple iphone 12", style: inter16Bold()),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text("Color", style: inter14Black()),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: <Widget>[
                                variantBox(
                                    name: "Black",
                                    boxColor: const Color(0xff1D1C22)),
                                variantBox(
                                    name: "White",
                                    boxColor: const Color(0xffFFFFFF)),
                                variantBox(
                                    name: "Red",
                                    boxColor: const Color(0xffE03637)),
                                variantBox(
                                    name: "Green",
                                    boxColor: const Color(0xffDCF3D7)),
                                variantBox(
                                    name: "Blue",
                                    boxColor: const Color(0xff033357)),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text("Capacity", style: inter14Black()),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: <Widget>[
                                variantBox(name: "64 GB"),
                                variantBox(name: "128 GB"),
                                variantBox(name: "256 GB"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    afterChangeButton(name: "Confirm"),
                  ],
                );
              });
            },
          );
        });
  }

  Widget variantBox({
    Color? bgColor,
    Color? boxColor,
    required String name,
    Function()? onClick,
    bool enable = true,
  }) {
    return InkWell(
      onTap: onClick,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: bgColor == null ? Colors.white : null,
              border: Border.all(color: primaryBlue),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: boxColor == null
                ? Text(name, style: inter14Medium())
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(width: 20, height: 20, color: boxColor),
                      const SizedBox(width: 12),
                      Text(name, style: inter14Medium()),
                    ],
                  ),
          ),
          Visibility(
            visible: !enable,
            child: Container(
              decoration: BoxDecoration(
                color: black.withOpacity(0.25),
                border: Border.all(color: black.withOpacity(0.25)),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

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
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CheckoutPage())),
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

  deleteSheet() {
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
            minChildSize: 0.5,
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
                                top: 56.0,
                                bottom: 20.0),
                            child: Text(
                                "Are you sure you want to delete this item from your purchase list?",
                                textAlign: TextAlign.center,
                                style: inter16Bold()),
                          ),
                        ],
                      ),
                    ),

                    /// Listview (list of data with check box for multiple selection & on tile tap single selection)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  "We know it might be hard for us, so make sure you have considered it carefully before proceeding",
                                  textAlign: TextAlign.center,
                                  style: inter14Black2Medium()),
                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
                      ),
                    ),
                    afterChangeButton(
                        name: "Yes, I am sure. Delete this item",
                        onClick: () async {
                          await showToast(
                              "Pick up in store successfully cancelled",
                              context);
                        }),
                    afterChangeButton(
                        name: "No, back to the store pickup list",
                        outlineColor: primaryBlue,
                        onClick: () async {
                          Navigator.pop(context);
                        }),
                  ],
                );
              });
            },
          );
        });
  }

  editAddressSheet({required int index}) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          controller: editAddressC,
          initialChildSize: 0.82,
          minChildSize: 0.82,
          maxChildSize: 0.96,
          expand: false,
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Consumer(builder: (context, ref, child) {
                  AccountAddressState state = ref.watch(accountAddressNotifier);
                  final editAddressNotifer =
                      ref.watch(accountAddressNotifier.notifier);
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                        child: Text("Edit Address",
                                            style: inter28Bold())),
                                    Expanded(
                                      flex: 5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () =>
                                                deleteConfirmAddressSheet(
                                                    index: index),
                                            child: SvgPicture.asset(
                                                "${iconsPath}trash.svg",
                                                color: red),
                                          ),
                                          const SizedBox(width: 16),
                                          InkWell(
                                            onTap: closeConfirmEditAddressSheet,
                                            child: const Icon(Icons.close),
                                          )
                                        ],
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
                          child: ListView(
                            controller: scrollController,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text("Address Labels",
                                        style: inter14Medium()),
                                    Text("*", style: inter14MediumRed()),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    addressLabel(
                                        title: "Home",
                                        value: home,
                                        onClick: () =>
                                            setState(() => home = true)),
                                    const SizedBox(width: 12),
                                    addressLabel(
                                        title: "Office",
                                        value: !home,
                                        onClick: () =>
                                            setState(() => home = false)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              fieldAddress(
                                required: true,
                                name: "Recipient's Name",
                                hint: "Recipient's Name",
                                controller: recipientC,
                                error: state.recipient.errorMessage,
                                onchanged: (val) {
                                  state = state.copyWith(
                                      recipient:
                                          state.recipient.copyWith(value: val));
                                  editAddressNotifer.checkField(
                                      val: state.recipient.value,
                                      fieldEmpty: state.recipient.isEmpty,
                                      fieldErrorMsg:
                                          state.recipient.errorMessage,
                                      errorMsg: "Nama Recepient harus diisi",
                                      type: "recipient");
                                },
                              ),
                              // const SizedBox(height: 16),
                              fieldAddress(
                                required: true,
                                name: "Mobile Phone Number",
                                hint: "Mobile Phone Number",
                                controller: phoneNumberC,
                                error: state.phoneNumber.errorMessage,
                                onchanged: (val) {
                                  state = state.copyWith(
                                      phoneNumber: state.phoneNumber
                                          .copyWith(value: val));
                                  editAddressNotifer.checkField(
                                      val: state.phoneNumber.value,
                                      fieldEmpty: state.phoneNumber.isEmpty,
                                      fieldErrorMsg:
                                          state.phoneNumber.errorMessage,
                                      errorMsg: "Nomor HP harus diisi",
                                      type: "phoneNumber");
                                },
                              ),
                              // const SizedBox(height: 16),
                              fieldAddress(
                                required: true,
                                name: "Complete Address",
                                hint: "Complete Address",
                                controller: addressC,
                                error: state.address.errorMessage,
                                onchanged: (val) {
                                  state = state.copyWith(
                                      address:
                                          state.address.copyWith(value: val));
                                  editAddressNotifer.checkField(
                                      val: state.address.value,
                                      fieldEmpty: state.address.isEmpty,
                                      fieldErrorMsg: state.address.errorMessage,
                                      errorMsg: "Alamat harus diisi",
                                      type: "address");
                                },
                              ),
                            ],
                          ),
                        ),
                        afterChangeButton(
                            name: "Save",
                            onClick: () {
                              editAddressNotifer.checkField(
                                  val: state.recipient.value,
                                  fieldEmpty: state.recipient.isEmpty,
                                  fieldErrorMsg: state.recipient.errorMessage,
                                  errorMsg: "Nama Recepient harus diisi",
                                  type: "recipient");
                              editAddressNotifer.checkField(
                                  val: state.phoneNumber.value,
                                  fieldEmpty: state.phoneNumber.isEmpty,
                                  fieldErrorMsg: state.phoneNumber.errorMessage,
                                  errorMsg: "Nomor HP harus diisi",
                                  type: "phoneNumber");
                              editAddressNotifer.checkField(
                                  val: state.address.value,
                                  fieldEmpty: state.address.isEmpty,
                                  fieldErrorMsg: state.address.errorMessage,
                                  errorMsg: "Alamat harus diisi",
                                  type: "address");
                              if (state.recipient.value != "" &&
                                  state.phoneNumber.value != "" &&
                                  state.address.value != "") {
                                editConfirmAddressSheet(index: index);
                              }
                            }),
                      ],
                    ),
                  );
                });
              },
            );
          },
        );
      },
    );
  }

  editConfirmAddressSheet({required int index}) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          controller: editAddressConfirmC,
          initialChildSize: 0.47,
          minChildSize: 0.1,
          maxChildSize: 0.96,
          expand: false,
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Consumer(builder: (context, ref, child) {
                  AccountAddressState state = ref.watch(accountAddressNotifier);
                  final editAddressNotifer =
                      ref.watch(accountAddressNotifier.notifier);
                  return Column(
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

                      /// Listview (list of data with check box for multiple selection & on tile tap single selection)
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                "It looks like you've made some changes to the existing data. Do you want to save these changes before continuing ?",
                                style: inter16Bold(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Text(
                                "By pressing yes, the data changes you make will be saved",
                                style: inter14Black2(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // const SizedBox(height: 16),
                          ],
                        ),
                      ),
                      afterChangeDoubleButton(
                        name1: "Yes, I want to save data",
                        name2: "No, I want to check the data",
                        onClick1: () {
                          List<AddressModel> temp = [];
                          for (int i = 0; i < addressList.length; i++) {
                            if (i == index) {
                              temp.add(AddressModel(
                                  label: state.label,
                                  name: state.recipient.value,
                                  phoneNumber: state.phoneNumber.value,
                                  completeAddress: state.address.value));
                              continue;
                            }
                            temp.add(AddressModel(
                                label: addressList[i].label,
                                name: addressList[i].name,
                                phoneNumber: addressList[i].phoneNumber,
                                completeAddress:
                                    addressList[i].completeAddress));
                          }
                          addressList = temp;
                          setState;
                          showToast("Data changes have been successfully saved",
                              context);

                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        onClick2: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
              },
            );
          },
        );
      },
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

  Widget addressLabel(
      {required String title, Function()? onClick, bool value = false}) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: value ? secondaryBlue : white,
            border: Border.all(color: primaryBlue)),
        child: Center(child: Text(title, style: inter14Medium())),
      ),
    );
  }

  closeConfirmAddAddressSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          controller: addAddressCloseConfirmC,
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
                              "Are you sure you want to close the add data form?",
                              style: inter16Bold(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Text(
                              "Pressing the yes button, will cancel adding data",
                              style: inter14Black2(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    afterChangeDoubleButton(
                      name1: "Yes, I canceled adding data",
                      name2: "No, I continue to add data",
                      onClick1: () {
                        Navigator.of(context)
                          ..pop()
                          ..pop();
                      },
                      onClick2: () {
                        showToast("Data changes have been successfully added",
                            context);
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

  closeConfirmEditAddressSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          controller: editAddressCloseConfirmC,
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
                              "Are you sure to close the edit form ?",
                              style: inter16Bold(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Text(
                              "closing the edit form will cancel the changes made",
                              style: inter14Black2(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    afterChangeDoubleButton(
                      name1: "Yes, I want to close the edit form",
                      name2: "No, I want to go back to editing",
                      onClick1: () {
                        Navigator.of(context)
                          ..pop()
                          ..pop();
                      },
                      onClick2: () {
                        showToast("Data changes have been successfully saved",
                            context);
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

  deleteConfirmAddressSheet({required int index}) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          controller: deleteAddressConfirmC,
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
                              "Are you sure you delete this data?",
                              style: inter16Bold(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Text(
                              "Pressing the Yes button will delete the data permanently",
                              style: inter14Black2(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    afterChangeDoubleButton(
                      name1: "Yes, I want to delete this data",
                      name2: "No, I want to go back to editing data",
                      onClick1: () {
                        addressList.removeAt(index);
                        showToast("Data deleted successfully", context);
                        setState;
                        Navigator.of(context)
                          ..pop()
                          ..pop()
                          ..pop();
                      },
                      onClick2: () {
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
}

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_gadget/application/account/account_address_state.dart';
import 'package:planet_gadget/library/textstyle.dart';
import 'package:planet_gadget/main.dart';
import 'package:planet_gadget/presentation/pages/account/setting_account_page.dart';
import 'package:planet_gadget/presentation/pages/shopping_cart/shopping_cart_page.dart';
import 'package:sizer/sizer.dart';

import '../../../application/account/account_address_notifier.dart';
import '../../../domain/entity/core/address_model.dart';
import '../../../library/color.dart';
import '../../../library/toast.dart';
import '../../../utils/constants/path.dart';
import '../purchase/purchase_page.dart';
import 'widgets/field.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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

  List<String> paymentList = ["Transfer Bank", "Gopay"];
  List<String> paymentFileList = ["bank_transfer2.png", "gopay.png"];

  List<AddressModel> addressList = [
    const AddressModel(
      label: "Home",
      name: "Yoshua",
      phoneNumber: "0822334449460",
      completeAddress: """Green Mansion Juanda 2 Safir J-05,
        Sidoarjo, Jawa Timur""",
    ),
  ];
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
                          // Expanded(
                          //   flex: 1,
                          //   child: InkWell(
                          //     onTap: null,
                          //     // onTap: () => Navigator.pop(context),
                          //     child: Icon(
                          //       Icons.navigate_before,
                          //       color: white,
                          //       size: 32,
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(width: 16),
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
                                  onTap: () => routes.navigateTo(context,
                                      page: ShoppingCartPage()),
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
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PurchasePage(
                                                initialIndex: 0))),
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
                              iconBox(
                                  name: "To Pay",
                                  iconName: "to_pay.svg",
                                  onClick: () => routes.navigateTo(context,
                                      page:
                                          const PurchasePage(initialIndex: 0))),
                              iconBox(
                                  name: "Packing",
                                  iconName: "packing.svg",
                                  onClick: () => routes.navigateTo(context,
                                      page:
                                          const PurchasePage(initialIndex: 1))),
                              iconBox(
                                  name: "Delivery",
                                  iconName: "delivery.svg",
                                  onClick: () => routes.navigateTo(context,
                                      page:
                                          const PurchasePage(initialIndex: 2))),
                              iconBox(
                                  name: "Arrived",
                                  iconName: "arrived.svg",
                                  onClick: () => routes.navigateTo(context,
                                      page:
                                          const PurchasePage(initialIndex: 3))),
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
                                  child: InkWell(
                                    onTap: addressSheet,
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
                                    ),
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
                                  child: InkWell(
                                    onTap: paymentSheet,
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
                                    ),
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
              return StatefulBuilder(
                builder: (context, setState) {
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
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return paymentBox(
                                borderRadius: 12,
                                width: 178,
                                imagePath: paymentFileList[index],
                                groupValue: payment1Value,
                                value: paymentList[index]);
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 12),
                          itemCount: paymentList.length,
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
        });
  }

  Widget paymentBox({
    required double borderRadius,
    double? height,
    double? width,
    required String imagePath,
    required String? groupValue,
    required String value,
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
              onChanged: (val) => setState(() => groupValue = val.toString()),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(value, style: inter14Bold()),
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
                    InkWell(
                      onTap: () => editAddressSheet(index: index),
                      child: SvgPicture.asset(
                        '${iconsAccountPath}edit.svg',
                        width: 15,
                        height: 15,
                      ),
                    )
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
}

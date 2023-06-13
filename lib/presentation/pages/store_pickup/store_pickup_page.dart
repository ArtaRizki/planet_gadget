import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planet_gadget/library/convert_currency.dart';
import 'package:planet_gadget/library/toast.dart';
import 'package:sizer/sizer.dart';

import '../../../library/color.dart';
import '../../../library/decoration.dart';
import '../../../library/textstyle.dart';
import '../../../utils/constants/path.dart';
import '../../core/appbar_widget.dart';
import '../purchase/purchase_page.dart';

class StorePickupPage extends StatefulWidget {
  const StorePickupPage({super.key});

  @override
  State<StorePickupPage> createState() => _StorePickupPageState();
}

class _StorePickupPageState extends State<StorePickupPage> {
  DraggableScrollableController dragC = DraggableScrollableController();
  TextEditingController searchC = TextEditingController();
  String searchValue = "";
  List searchResult = [];
  TextEditingController numberC = TextEditingController();
  String numberValue = "";
  String numberErrorText = "";
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        appBar: appBarWidget(title: "Store Pickup", context: context),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: TextFormField(
                              // autofocus: true,
                              controller: searchC,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onChanged: (val) => onChangedSearch(val),
                              style: inter14Medium(),
                              cursorColor: primaryBlue,
                              decoration: searchDecoration(
                                "Masukkan lokasi Toko",
                                onClear: () {
                                  searchC.clear();
                                  searchValue = "";
                                  searchResult.clear();
                                  setState(() {});
                                },
                                borderColor: secondaryBlue,
                              ),
                              scrollPadding: const EdgeInsets.only(bottom: 52),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: white,
                                    border: Border.all(color: primaryBlue),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.black),
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // color: successBgColor,
                      color: errorBgColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                    "${iconsPath}location-marker.svg")),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 9,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Sidoarjo", style: inter14Bold()),
                                const SizedBox(height: 4),
                                Text(
                                    "7,52 KM | Planet Gadget Brigjen Katamso Waru",
                                    style: inter12MediumBlack2()),
                                Row(
                                  children: <Widget>[
                                    Text("Stock", style: inter12MediumBlack2()),
                                    const SizedBox(width: 12),
                                    // Text("Ready", style: inter12BBoldSuccess())
                                    Text("Not Ready",
                                        style: inter12BBoldError())
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          Text("Number KTP/SIM/KITAS", style: inter14Medium()),
                          Text("*", style: inter14MediumRed()),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: TextFormField(
                        controller: numberC,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          // val = val.toString().trim();
                          // if (val == "" || val.isEmpty || val == "null") {
                          //   return "Nama kategori belum diisi";
                          // }
                          return null;
                        },
                        onChanged: (val) {
                          numberValue = val;
                          val = val.toString().trim();
                          setState(() {});
                        },
                        style: inter12(),
                        cursorColor: primaryBlue,
                        decoration: generalDecoration(
                            "Input your number KTP/SIM/KITAS", false),
                        scrollPadding: const EdgeInsets.only(bottom: 52),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return productItem();
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                          itemCount: 2),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  refresh() {}

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
                  onTap: () => variantSheet(),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: secondaryBlue,
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
                    onTap: () => deleteSheet(),
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

  termsSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
            controller: dragC,
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
                                    child: Text("Terms and Conditions",
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
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  "Pemilihan toko yang sudah dipilih oleh konsumen tidak dapat diubah kembali.Konsumen hanya dapat melakukan pengembalian barang di toko pilihan dengan tanggal dan sesi yang sudah dipilih pada saat melakukan transaksi.Untuk melakukan pengembalian barang, wajib konsumen langsung yang datang, sesuai dengan data pemesan dan tidak dapat diwakilkan.Transaksi pembayaran yang sudah berhasil tidak dapat dibatalkan dengan alasan apapun (termasuk pembatalan dengan pengembalian uang.\n\n1.Pemilihan toko yang sudah dipilih oleh konsumen tidak dapat diubah kembali.\n2.Konsumen hanya dapat melakukan pengembalian barang di toko pilihan dengan tanggal dan sesi yang sudah dipilih pada saat melakukan transaksi.\n3.Untuk melakukan pengembalian barang, wajib konsumen langsung yang datang, sesuai dengan data pemesan dan tidak dapat diwakilkan.\n4.Transaksi pembayaran yang sudah berhasil tidak dapat dibatalkan dengan alasan apapun (termasuk pembatalan dengan pengembalian uang.",
                                  style: inter14Black2Medium()),
                              const SizedBox(height: 12),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          border: Border.all(color: black)),
                                      width: 16,
                                      height: 24,
                                      child: Checkbox(
                                        value: agree,
                                        onChanged: (val) => setState(
                                            () => agree = val ?? false),
                                        fillColor:
                                            MaterialStateProperty.all(white),
                                        overlayColor:
                                            MaterialStateProperty.all(white),
                                        checkColor: black,
                                        activeColor: white,
                                        // shape: RoundedRectangleBorder(
                                        //   borderRadius:
                                        //       BorderRadius.circular(2),
                                        //   side: BorderSide(color: black),
                                        // ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    flex: 14,
                                    child: Text(
                                        "Yes, I agree to the terms and conditions that apply",
                                        style: inter14MediumBlack()),
                                  )
                                ],
                              ),
                            ],
                          ),
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
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }

  Widget bottomButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: () => termsSheet(),
            overlayColor: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.pressed) ? secondaryBlue : null),
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
                  Text("Terms and Conditions", style: inter16Bold()),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
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
                  Text("Order now", style: inter16Bold()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

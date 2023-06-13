import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
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

class NewProductPage extends StatefulWidget {
  const NewProductPage({super.key});

  @override
  State<NewProductPage> createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  DraggableScrollableController dragC = DraggableScrollableController();
  TextEditingController searchC = TextEditingController();
  String searchValue = "";
  List searchResult = [];
  TextEditingController priceLowC = TextEditingController();
  TextEditingController priceHighC = TextEditingController();
  String priceLowValue = "";
  String priceHighValue = "";
  String priceLowErrorText = "";
  String priceHighErrorText = "";
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        appBar: appBarWidget(title: "New product", context: context),
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
                              decoration: searchDecoration("Cari produk",
                                  onClear: () {
                                searchC.clear();
                                searchValue = "";
                                searchResult.clear();
                                setState(() {});
                              },
                                  borderColor: secondaryBlue,
                                  clearIcon: searchC.text.isNotEmpty),
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
                      height: 68,
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                      child: ListView.separated(
                        padding: const EdgeInsets.only(right: 20),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: sortSheet,
                              child: filterBox(name: "Filter"));
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8),
                        itemCount: 5,
                      ),
                    ),
                    GridView.builder(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 24, left: 20, right: 20),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    offset: const Offset(0, 0),
                                    blurRadius: 4,
                                    color: black25)
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 8,
                                  child: Center(
                                    child: SizedBox(
                                      width: 131,
                                      height: 146,
                                      child: Image.asset(
                                        "${productsPath}iphone_12_mini_blue_1_1_5_2 1.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                // const SizedBox(height: 8),
                                Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Text(
                                          "Apple Iphone 12 128Gb" +
                                              "aaaaaaaaaaaaaaaa",
                                          style: inter12MediumBlack()),
                                    )),
                                // const SizedBox(height: 8),
                                Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Text(
                                          convertToIdr(nominal: "Rp12.999.000"),
                                          style: inter14Bold()),
                                    )),
                              ],
                            ),
                          );
                        },
                        itemCount: 10),
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

  Widget filterBox({required String name, bool filterButton = false}) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: primaryBlue),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: <Widget>[
          !filterButton
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset('${iconsPath}adjustments.svg'),
                ),
          Text(name, style: inter14MediumBlack()),
        ],
      ),
    );
  }

  void sortSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
            controller: DraggableScrollableController(),
            maxChildSize: 0.9,
            minChildSize: 0.9,
            initialChildSize: 0.9,
            expand: false,
            snap: true,
            builder: (context, scrollController) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(color: white),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 8),
                              color: Colors.black,
                              width: 100,
                              height: 4,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0,
                                right: 15.0,
                                top: 10.0,
                                bottom: 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /// Bottom sheet title text
                                Expanded(
                                    child:
                                        Text("Filter", style: inter20Bold())),

                                /// Done button
                                Visibility(
                                  visible: true,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Icon(Icons.close),
                                    ),
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
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 12),
                                  child: Text("Price", style: inter16Medium()),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        controller: priceLowC,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (val) {
                                          // val = val.toString().trim();
                                          // if (val == "" || val.isEmpty || val == "null") {
                                          //   return "Nama kategori belum diisi";
                                          // }
                                          return null;
                                        },
                                        onChanged: (val) {
                                          priceLowValue = val;
                                          val = val.toString().trim();
                                          setState(() {});
                                        },
                                        style: inter14(),
                                        cursorColor: primaryBlue,
                                        decoration:
                                            generalDecorationWoIconWPrefix(
                                                "Terendah", false, "Rp"),
                                        scrollPadding:
                                            const EdgeInsets.only(bottom: 52),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        controller: priceHighC,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (val) {
                                          // val = val.toString().trim();
                                          // if (val == "" || val.isEmpty || val == "null") {
                                          //   return "Nama kategori belum diisi";
                                          // }
                                          return null;
                                        },
                                        onChanged: (val) {
                                          priceHighValue = val;
                                          val = val.toString().trim();
                                          setState(() {});
                                        },
                                        style: inter14(),
                                        cursorColor: primaryBlue,
                                        decoration:
                                            generalDecorationWoIconWPrefix(
                                                "Tertinggi", false, "Rp"),
                                        scrollPadding:
                                            const EdgeInsets.only(bottom: 52),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, bottom: 12),
                                  child:
                                      Text("Sort by", style: inter16Medium()),
                                ),
                                Container(
                                  height: 50,
                                  margin: const EdgeInsets.only(bottom: 16),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.only(right: 20),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                          onTap: null,
                                          child:
                                              filterBox(name: "Alphabet A-Z"));
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(width: 12),
                                    itemCount: 5,
                                  ),
                                ),
                                Wrap(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () => setState(() {
                                        // sortNameAZ =
                                        //     sortNameAZ == true ? null : true;
                                        // sortItemBesarKecil = null;
                                        // sortStatusAktif = null;
                                      }),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: primaryBlue,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border:
                                              Border.all(color: secondaryBlue),
                                        ),
                                        child: Text("Nama A ke Z",
                                            style:
                                                // sortNameAZ == true &&
                                                //         sortNameAZ != null
                                                //     ? inter14MediumYellow()
                                                // :
                                                inter14Medium()),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    InkWell(
                                      onTap: () => setState(() {
                                        // sortNameAZ =
                                        //     sortNameAZ == false ? null : false;
                                        // sortItemBesarKecil = null;
                                        // sortStatusAktif = null;
                                      }),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: primaryBlue,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border:
                                              Border.all(color: secondaryBlue),
                                        ),
                                        child: Text("Nama Z ke A",
                                            style:
                                                //  sortNameAZ == true ||
                                                //         sortNameAZ == null
                                                //     ? inter14Medium()
                                                //     :
                                                inter14MediumYellow()),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  child: Text("Jumlah Item",
                                      style: inter16Medium()),
                                ),
                                Wrap(
                                  runSpacing: 8,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () => setState(() {
                                        // sortNameAZ = null;
                                        // sortItemBesarKecil =
                                        //     sortItemBesarKecil == true
                                        //         ? null
                                        //         : true;
                                        // sortStatusAktif = null;
                                      }),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: primaryBlue,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border:
                                              Border.all(color: secondaryBlue),
                                        ),
                                        child: Text("Jumlah Besar ke Kecil",
                                            style:
                                                // sortItemBesarKecil == true &&
                                                //         sortItemBesarKecil != null
                                                //     ? inter14MediumYellow()
                                                //     :
                                                inter14Medium()),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    InkWell(
                                      onTap: () => setState(() {
                                        // sortNameAZ = null;
                                        // sortItemBesarKecil =
                                        //     sortItemBesarKecil == false
                                        //         ? null
                                        //         : false;
                                        // sortStatusAktif = null;
                                      }),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: primaryBlue,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border:
                                              Border.all(color: secondaryBlue),
                                        ),
                                        child: Text("Jumlah Kecil ke Besar",
                                            style:
                                                // sortItemBesarKecil == true ||
                                                //         sortItemBesarKecil == null
                                                //     ? inter14Medium()
                                                //     :
                                                inter14MediumYellow()),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  child: Text("Status", style: inter16Medium()),
                                ),
                                Wrap(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        // kp.setKategoriList = listTemp;
                                        // setState(() {
                                        //   // sortNameAZ = null;
                                        //   // sortItemBesarKecil = null;
                                        //   sortStatusAktif =
                                        //       sortStatusAktif == true
                                        //           ? null
                                        //           : true;
                                        // });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: primaryBlue,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border:
                                              Border.all(color: secondaryBlue),
                                        ),
                                        child: Text("Aktif",
                                            style:
                                                // sortStatusAktif == true &&
                                                //         sortStatusAktif != null
                                                //     ? inter14MediumYellow()
                                                //     :
                                                inter14Medium()),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    InkWell(
                                      onTap: () {
                                        // kp.setKategoriList = listTemp;
                                        // setState(() {
                                        //   // sortNameAZ = null;
                                        //   // sortItemBesarKecil = null;
                                        //   sortStatusAktif =
                                        //       sortStatusAktif == false
                                        //           ? null
                                        //           : false;
                                        // });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: primaryBlue,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border:
                                              Border.all(color: secondaryBlue),
                                        ),
                                        child: Text("Nonaktif",
                                            style:
                                                // sortStatusAktif == true ||
                                                //         sortStatusAktif == null
                                                //     ? inter14Medium()
                                                //     :
                                                inter14MediumYellow()),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.transparent,
                                            fixedSize: Size(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                40),
                                            primary: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: primaryBlue),
                                                borderRadius:
                                                    BorderRadius.circular(6))),
                                        onPressed: () {
                                          // kp.setKategoriList = listTemp;
                                          // sortNameAZ = null;
                                          // sortItemBesarKecil = null;
                                          // sortStatusAktif = null;
                                          // setState(() {});
                                          // Navigator.pop(context);
                                        },
                                        child: Text('Reset',
                                            style: inter16Medium())),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            shadowColor:
                                                MaterialStateProperty.all<Color>(
                                                    Colors.transparent),
                                            fixedSize: MaterialStateProperty.all(Size(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                40)),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6))),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primaryBlue)),
                                        onPressed: () async {
                                          // await saveFilter();
                                          Navigator.pop(context);
                                        },
                                        child: Text("Simpan", style: inter16Medium())),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              });
            },
          );
        });
  }
}

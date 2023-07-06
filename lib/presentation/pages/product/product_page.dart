import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planet_gadget/library/convert_currency.dart';
import 'package:planet_gadget/main.dart';
import 'package:planet_gadget/presentation/pages/checkout/checkout_page.dart';
import 'package:planet_gadget/presentation/pages/shopping_cart/shopping_cart_page.dart';
import 'package:planet_gadget/presentation/pages/store_pickup/store_pickup_page.dart';
import 'package:sizer/sizer.dart';

import '../../../application/product/product_notifier.dart';
import '../../../library/color.dart';
import '../../../library/textstyle.dart';
import '../../../utils/constants/path.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  String shipping1Value = "JNE";
  DraggableScrollableController dragC = DraggableScrollableController();

  @override
  void initState() {
    // ref.read(productNotifier.notifier).getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productNotifier);
    final productStateNotifier = ref.read(productNotifier.notifier);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white.withOpacity(0.75),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.navigate_before,
                color: black,
                size: 32,
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                '${iconsPath}share.svg',
                width: 24,
                height: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () =>
                    routes.navigateTo(context, page: ShoppingCartPage()),
                child: SvgPicture.asset(
                  '${iconsPath}shopping-cart.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: white,
        bottomNavigationBar: bottomButton(),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: RefreshIndicator(
            onRefresh: () {
              return refresh();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 16),
                    height: 50.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                            "${productsPath}iphone_12_mini_blue_1_1_5_2 1.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return imageBox(
                            borderRadius: 0,
                            width: 60,
                            imagePath:
                                "${productsPath}iphone_12_mini_blue_1_1_5_2 1.png");
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      itemCount: 8,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(convertToIdr(nominal: "129999000"),
                            style: inter20Bold()),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            '${iconsPath}heart.svg',
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                        Text("Apple Iphone 12", style: inter14MediumBlack2()),
                  ),
                  const SizedBox(height: 16),
                  shippingOption(),
                  variant()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  refresh() async {}

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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StorePickupPage())),
              overlayColor: MaterialStateProperty.resolveWith((states) =>
                  states.contains(MaterialState.pressed)
                      ? secondaryBlue
                      : null),
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
                    SvgPicture.asset("${iconsPath}store.svg",
                        width: 20, height: 20),
                    const SizedBox(width: 8),
                    Text("Store pickup", style: inter16Bold()),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 5,
            child: InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShoppingCartPage())),
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
                    SvgPicture.asset(
                      "${iconsPath}shopping-cart.svg",
                      width: 20,
                      height: 20,
                      color: white,
                    ),
                    const SizedBox(width: 8),
                    Text("Add to cart", style: inter16BoldWhite()),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget shippingOption() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Shipping Option", style: inter16Bold()),
              InkWell(
                  onTap: () => shippingSheet(),
                  child: Text("Change shipping", style: inter12Black2())),
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
                child: SvgPicture.asset("${iconsPath}shipping.svg",
                    width: 40, height: 40),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
          // Text(
          //     "Choose your delivery first to find out the shipping cost and estimated arrival of the item",
          //     style: inter14Black2())
        ],
      ),
    );
  }

  Widget variant() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Variant", style: inter16Bold()),
              InkWell(
                  onTap: () => variantSheet(),
                  child: Text("Change variant", style: inter12Black2())),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(thickness: 1, color: black3),
          ),
          Text("Color", style: inter14Black()),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: white,
              border: Border.all(color: primaryBlue),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(width: 20, height: 20, color: Colors.black),
                const SizedBox(width: 12),
                Text("Black", style: inter14Medium()),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text("Capacity", style: inter14Black()),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: white,
              border: Border.all(color: primaryBlue),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text("64 GB", style: inter14Medium()),
          ),
          const SizedBox(height: 32),
          Text("Product specifications", style: inter16Bold()),
          const SizedBox(height: 16),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return productSpecItem("AllBrand", "Iphone");
              },
              separatorBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      thickness: 1,
                      color: gray4,
                    ));
              },
              itemCount: 5),
          const SizedBox(height: 32),
          Text("Product description", style: inter16Bold()),
          const SizedBox(height: 16),
          Text(
              "1. Desain Elegan: iPhone 12 memiliki desain yang ramping dan elegan dengan bodi berbahan kaca dan frame stainless steel yang memberikan kesan premium.\n\n2. Layar Super Retina XDR: Dilengkapi dengan layar Super Retina XDR berukuran 6,1 inci, iPhone 12 memberikan pengalaman visual yang tajam dan jelas dengan dukungan HDR untuk konten yang lebih kaya dan realistis.\n\n3. Kinerja Cepat: Ditenagai oleh chip A14 Bionic yang canggih, iPhone 12 menawarkan kinerja yang sangat cepat dan responsif. Dalam hal kecepatan, kemampuan multitugas, dan grafis, iPhone 12 menjadi salah satu smartphone terkuat di pasaran.\n\n4. Kemampuan Fotografi yang Hebat: iPhone 12 dilengkapi dengan sistem kamera ganda yang terdiri dari lensa utama 12 MP dan lensa ultra wide 12 MP. Ini memungkinkan pengambilan foto yang kaya detail, dengan mode malam yang unggul, pemotretan potret berkualitas tinggi, dan kemampuan merekam video 4K.\n\n5. 5G dan Aksesori MagSafe: iPhone 12 mendukung konektivitas 5G, memberikan kecepatan internet yang sangat tinggi. Selain itu, iPhone 12 juga mendukung aksesori MagSafe, yang memungkinkan penggunaan aksesori magnetik seperti charger nirkabel, case, dan aksesoris lainnya dengan mudah.\n\n6. Perlindungan Tahan Air dan Debu: iPhone 12 memiliki sertifikasi IP68, yang berarti tahan terhadap air hingga kedalaman 6 meter selama 30 menit dan tahan debu. Hal ini menjadikannya pilihan yang baik untuk pengguna yang aktif dan sering berada di lingkungan yang berpotensi terkena air atau debu.\n\n7. Pengalaman iOS yang Lancar: Seperti semua iPhone, iPhone 12 menjalankan sistem operasi iOS yang menawarkan pengalaman yang lancar, aman, dan terintegrasi dengan baik dengan ekosistem Apple. Pengguna dapat mengakses berbagai aplikasi, layanan, dan fitur tambahan yang tersedia di App Store.",
              style: inter12MediumBlack()),
        ],
      ),
    );
  }

  Widget productSpecItem(String title, String description) {
    return Row(
      children: <Widget>[
        Expanded(flex: 5, child: Text(title, style: inter14Black2Medium())),
        Expanded(flex: 5, child: Text(description, style: inter14Bold())),
      ],
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
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planet_gadget/library/convert_currency.dart';
import 'package:sizer/sizer.dart';

import '../../../library/color.dart';
import '../../../library/textstyle.dart';
import '../../../utils/constants/path.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
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
                onTap: () => Navigator.pop(context),
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
                    child: Text(convertToIdr(nominal: "129999000"),
                        style: inter20Bold()),
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

  Widget bottomButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: white,
                border: Border.all(color: primaryYellow, width: 2),
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
          const SizedBox(width: 12),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: primaryYellow,
                border: Border.all(color: primaryYellow, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset("${iconsPath}shopping-cart.svg",
                      width: 20, height: 20),
                  const SizedBox(width: 8),
                  Text("Add to cart", style: inter16Bold()),
                ],
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
                  onTap: () {},
                  child: Text("Change shipping", style: inter12Black2())),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(thickness: 1, color: black3),
          ),
          Text(
              "Choose your delivery first to find out the shipping cost and estimated arrival of the item",
              style: inter14Black2())
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
                  onTap: () {},
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
              border: Border.all(color: primaryYellow),
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
              border: Border.all(color: primaryYellow),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text("64 GB", style: inter14Medium()),
          ),
          const SizedBox(height: 32),
          Text("Product specifications", style: inter16Bold()),
          const SizedBox(height: 16),
          ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return productSpecItem("Brand", "Iphone");
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
              style: inter12BlackMedium()),
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
}

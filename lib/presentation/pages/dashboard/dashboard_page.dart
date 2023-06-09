import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_gadget/library/convert_currency.dart';
import 'package:planet_gadget/library/loading.dart';
import 'package:planet_gadget/library/textstyle.dart';
import 'package:planet_gadget/presentation/pages/account/widgets/field.dart';
import 'package:planet_gadget/presentation/pages/article/article_page.dart';
import 'package:planet_gadget/presentation/pages/member/member_page.dart';
import 'package:planet_gadget/presentation/pages/notification/notification_page.dart';
import 'package:planet_gadget/presentation/pages/shopping_cart/shopping_cart_page.dart';
import 'package:sizer/sizer.dart';

import '../../../application/product/best/product_best_notiifer.dart';
import '../../../application/product/new/product_new_notiifer.dart';
import '../../../application/product/product_notifier.dart';
import '../../../domain/entity/product/product_model.dart';
import '../../../library/color.dart';
import '../../../main.dart';
import '../../../utils/constants/path.dart';
import '../../../utils/constants/url.dart';
import '../best_selling_product/best_selling_product_page.dart';
import '../brand/all_brand_page.dart';
import '../brand/brand_page.dart';
import '../choice_for_you/choice_for_you_page.dart';
import '../new_product/new_product_page.dart';
import '../product/product_page.dart';
import '../catalog/catalog_page.dart';
import '../promo/promo_page.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  TextEditingController searchC = TextEditingController();
  String searchValue = "";
  List searchResult = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productNotifier);
    final productNewState = ref.watch(productNewNotifier);
    final productBestState = ref.watch(productBestNotifier);
    final productStateNotifier = ref.read(productNotifier.notifier);
    final productNewStateNotifier = ref.read(productNewNotifier.notifier);
    final productBestStateNotifier = ref.read(productBestNotifier.notifier);
    List<List<ProductModel>> data = productNewState.maybeWhen(
        data: (product) => product, orElse: () => [[]]);
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
                            AssetImage("${backgroundsPath}bg_dashboard3.png"))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: Text("Hello, Yoshua", style: inter20Bold()),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 26, 10, 24),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 7,
                            child: searchField(
                              hint: "Find the product you want",
                              controller: searchC,
                              onChanged: (val) => onChangedSearch(val),
                              onClear: () {
                                searchC.clear();
                                searchValue = "";
                                searchResult.clear();
                                setState(() {});
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NotificationPage())),
                                child: const Icon(Icons.notifications_outlined,
                                    color: Colors.black)),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                                onTap: () => routes.navigateTo(context,
                                    page: ShoppingCartPage()),
                                child: const Icon(Icons.shopping_cart_outlined,
                                    color: Colors.black)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                    "${iconsPath}location-marker.svg")),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Planet Gadgets near you",
                                  style: inter14MediumBlack()),
                              const SizedBox(height: 5),
                              Text(
                                  "7,52 KM | Planet Gadget Brigjen Katamso Waru",
                                  style: inter12MediumBlack2())
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: secondaryBlue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: <Widget>[
                                const SizedBox(width: 20),
                                SvgPicture.asset(
                                    "${iconsPath}currency-dollar.svg"),
                                const SizedBox(width: 10),
                                Text(
                                  "100 Coin",
                                  style: inter12MediumBlack(),
                                )
                              ],
                            ),
                          ),
                          Container(color: Colors.black, width: 1, height: 20),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () => routes.navigateTo(context,
                                  page: MemberPage()),
                              child: Row(
                                children: <Widget>[
                                  const SizedBox(width: 20),
                                  SvgPicture.asset(
                                    "${iconsPath}member.svg",
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Gold Member",
                                    style: inter12MediumBlack(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
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
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                colorBox(
                                  bgColor: 0xffCEDBFD,
                                  mainColor: 0xff385FE8,
                                  imageName: "receipt-tax.svg",
                                  name: "Promo",
                                  onClick: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const PromoPage();
                                      },
                                    ),
                                  ),
                                ),
                                colorBox(
                                  bgColor: 0xffCFFCDB,
                                  mainColor: 0xff35E565,
                                  imageName: "badge-check.svg",
                                  name: "All Brand",
                                  onClick: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const AllBrandPage();
                                      },
                                    ),
                                  ),
                                ),
                                colorBox(
                                  bgColor: 0xffFCE3CF,
                                  mainColor: 0xffE68831,
                                  imageName: "book-open.svg",
                                  name: "Article",
                                  onClick: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const ArticlePage();
                                      },
                                    ),
                                  ),
                                ),
                                colorBox(
                                  bgColor: 0xffF8D3E4,
                                  mainColor: 0xffE7408F,
                                  imageName: "clipboard-list.svg",
                                  name: "E-Catalog",
                                  onClick: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const CatalogPage();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 141,
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 20),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => routes.navigateTo(context,
                                      page: const PromoPage()),
                                  child: imageBox(
                                      width: 233,
                                      height: 131,
                                      borderRadius: 12,
                                      imagePath:
                                          "$bannerPath${index % 2 != 0 ? "promo2" : "promo"}.png"),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemCount: 3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Special for members only",
                                    style: inter16Bold()),
                                InkWell(
                                    onTap: () {},
                                    child: Text("See More",
                                        style: inter12MediumBlack())),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 258,
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 28),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return imageBox(
                                    width: 175,
                                    height: 248,
                                    borderRadius: 12,
                                    imagePath: "${bannerPath}promo3.jpg");
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemCount: 3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Preferred brands", style: inter16Bold()),
                                InkWell(
                                    onTap: () => routes.navigateTo(context,
                                        page: BrandPage()),
                                    child: Text("See More",
                                        style: inter12MediumBlack())),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 80,
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.only(right: 20, bottom: 28),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return imageBox(
                                    width: 120,
                                    height: 60,
                                    borderRadius: 12,
                                    imagePath: "${merekPath}asus.png");
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemCount: 3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Choice for you", style: inter16Bold()),
                                InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChoiceForYouPage())),
                                    child: Text("See More",
                                        style: inter12MediumBlack())),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 251,
                            child: productState.when(
                              initial: () => const SizedBox(),
                              loading: () => loadingWidget,
                              data: (product) => ListView.separated(
                                padding: const EdgeInsets.only(
                                    right: 20, bottom: 32),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 8),
                                itemCount: product.first.length,
                                itemBuilder: (context, index) {
                                  final item = product.first[index];
                                  return cardProduct(
                                    imageName: "$baseUrl${item.url}",
                                    price: convertToIdr(nominal: "12999000"),
                                    productName: item.name,
                                    onClick: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProductPage()),
                                    ),
                                  );
                                },
                              ),
                              error: (error) => Text(error ?? "Error"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("New product", style: inter16Bold()),
                                InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const NewProductPage())),
                                    child: Text("See More",
                                        style: inter12MediumBlack())),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 251,
                            child: data.first.isEmpty
                                ? Text("KOSONG")
                                : ListView.separated(
                                    padding: const EdgeInsets.only(
                                        right: 20, bottom: 32),
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(width: 8),
                                    itemCount: data.first.length,
                                    itemBuilder: (context, index) {
                                      final item = data.first[index];
                                      return cardProduct(
                                        imageName: "$baseUrl${item.url}",
                                        price:
                                            convertToIdr(nominal: "12999000"),
                                        productName: item.name,
                                        onClick: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProductPage()),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Best selling product",
                                    style: inter16Bold()),
                                InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BestSeliingProductPage())),
                                    child: Text("See More",
                                        style: inter12MediumBlack())),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 251,
                            child: productBestState.when(
                                initial: () => const SizedBox(),
                                loading: () => loadingWidget,
                                data: (productBest) => ListView.separated(
                                      padding: const EdgeInsets.only(
                                          right: 20, bottom: 32),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(width: 8),
                                      itemCount: productBest.first.length,
                                      itemBuilder: (context, index) {
                                        final item = productBest.first[index];
                                        return cardProduct(
                                          imageName: "$baseUrl${item.url}",
                                          price:
                                              convertToIdr(nominal: "12999000"),
                                          productName: item.name,
                                          onClick: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProductPage()),
                                          ),
                                        );
                                      },
                                    ),
                                error: (error) => Text(error ?? "Error")),
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
              flex: 9,
              child: SizedBox(
                width: 131,
                // height: 145,
                child: Image.asset(
                  "${productsPath}iphone_12_mini_blue_1_1_5_2 1.png",
                  fit: BoxFit.contain,
                ),
                // child: Image.network(
                //   imageName,
                //   fit: BoxFit.contain,
                // ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: inter12MediumBlack()),
              ),
            ),
            const SizedBox(height: 4),
            Text(price, style: inter14Bold()),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planet_gadget/presentation/pages/brand/brand_page.dart';
import 'package:planet_gadget/utils/constants/path.dart';

import '../../../library/color.dart';
import '../../core/appbar_widget.dart';

class AllBrandPage extends StatefulWidget {
  const AllBrandPage({super.key});

  @override
  State<AllBrandPage> createState() => _AllBrandPageState();
}

class _AllBrandPageState extends State<AllBrandPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: appBarWidget(title: "Preferred All Brands", context: context),
        backgroundColor: white,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: RefreshIndicator(
            onRefresh: () {
              return refresh();
            },
            child: GridView.builder(
                padding: const EdgeInsets.only(
                    top: 32, bottom: 24, left: 20, right: 20),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BrandPage())),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                offset: const Offset(0, 0),
                                blurRadius: 4,
                                color: black25)
                          ],
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("${merekPath}acer.png"))),
                    ),
                  );
                },
                itemCount: 10),
          ),
        ),
      ),
    );
  }

  refresh() async {}
}

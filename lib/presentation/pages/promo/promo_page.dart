import 'package:flutter/material.dart';
import 'package:planet_gadget/utils/constants/path.dart';

import '../../../library/color.dart';
import '../../core/appbar_widget.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: appBarWidget(title: "Promo", context: context),
        backgroundColor: white,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: RefreshIndicator(
            onRefresh: () {
              return refresh();
            },
            child: ListView.separated(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 173,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("${bannerPath}promo2.jpg"))),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: 10),
          ),
        ),
      ),
    );
  }

  refresh() async {}
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:planet_gadget/utils/constants/path.dart';

import '../../../library/color.dart';
import '../../../library/loading.dart';
import '../../core/appbar_widget.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  late ScrollController _scrollController;
  bool _isLoading = false;
  bool allLoaded = false;
  int page = 1;
  List<String> promoList = [];

  fetch() {
    if (allLoaded) {
      return;
    }
    page++;
    log("PAGE :$page");
    // get api again page ++
    promoList.add("promo2");
    promoList.add("promo2");
    // allLoaded = dataGetHistoryKomisiSudahDicairkan.isEmpty ||
    //       dataGetHistoryKomisiSudahDicairkan['ListDataKomisi'].length == 0 ||
    //       listHistoryKomisiSudahDicairkan.length % 10 != 0;
    // allLoaded = promoList.length % 10 != 0;
    setState(() {});
  }

  refresh() async {
    promoList.clear();
    page = 1;
    allLoaded = false;
    setState(() {});
    init();
  }

  init() {
    _isLoading = true;
    // allLoaded = promoList.isEmpty ? false : true;
    // get api
    promoList = [
      "promo",
      "promo",
      "promo",
      "promo",
      "promo",
      "promo",
      "promo",
      "promo",
      "promo",
      "promo",
    ];

    if (promoList.length < 10 || promoList.length < 10) {
      // allLoaded = true;
    }
    _isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    init();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.atEdge && !_isLoading) {
          bool isTop = _scrollController.position.pixels == 0;
          if (isTop) {
            log('At the top');
          } else {
            fetch();
          }
        }
      });
    super.initState();
  }

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
            child: _isLoading
                ? loadingWidget
                : ListView.separated(
                    physics: const ClampingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    controller: _scrollController,
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 24, left: 20, right: 20),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index < promoList.length) {
                        return Container(
                          height: 173,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "$bannerPath${promoList[index]}.png"))),
                        );
                      }
                      if (promoList.isEmpty) {
                        return const Text("Tidak ada data");
                      }
                      return loadingWidget;
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount:
                        allLoaded ? promoList.length : promoList.length + 1),
          ),
        ),
      ),
    );
  }
}

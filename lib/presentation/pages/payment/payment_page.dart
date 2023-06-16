import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_gadget/library/convert_currency.dart';
import 'package:planet_gadget/presentation/pages/payment/pending_payment_page.dart';

import '../../../library/color.dart';
import '../../../library/textstyle.dart';
import '../../../utils/constants/path.dart';
import '../../core/appbar_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late ExpandableController expandC;
  @override
  void initState() {
    expandC = ExpandableController();
    expandC.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        appBar: appBarWidget(title: "Payment", context: context),
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
                      const SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Total Payment", style: inter14MediumBlack2()),
                          Text(convertToIdr(nominal: "12999000"),
                              style: inter14Bold()),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Divider(thickness: 1, color: gray4),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Payment within",
                                  style: inter14MediumBlack2()),
                              const SizedBox(height: 4),
                              Text("Due on 30 May 2023, 15:10",
                                  style: inter12MediumBlack2()),
                            ],
                          ),
                          Text("23 Hours 46 Minutes", style: inter14Bold()),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Image.asset("${iconsPaymentPath}bca.png"),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Bank BCA", style: inter14Bold()),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Divider(thickness: 1, color: gray4),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Account Number",
                                            style: inter14MediumBlack2()),
                                        const SizedBox(height: 8),
                                        Text("126 0822 3344 4946",
                                            style: inter14Bold()),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 12),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: primaryBlue),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        "Copy",
                                        style: inter14MediumBlack2(),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),
                      ExpandablePanel(
                        controller: expandC,
                        theme: ExpandableThemeData(
                            iconColor: black, tapHeaderToExpand: true),
                        collapsed: const SizedBox(),
                        header: Padding(
                          padding: const EdgeInsets.only(top: 9),
                          child: Text("mBanking", style: inter14Medium()),
                        ),
                        expanded: ListView(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: mBanking,
                          //  Transfer ATM
                        ),
                      ),
                      !(expandC.expanded)
                          ? Divider(thickness: 1, color: gray4)
                          : const SizedBox()
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

  Widget bottomButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: white,
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PendingPaymentPage())),
        overlayColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.pressed) ? secondaryBlue : null),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: primaryBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Ok", style: inter16BoldWhite()),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> mBanking = [
    Divider(thickness: 1, color: gray4),
    Row(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            decoration:
                BoxDecoration(color: primaryYellow, shape: BoxShape.circle),
            child: Text("1", style: inter14MediumBlack())),
        const SizedBox(width: 8),
        Flexible(
          child: RichText(
            text: TextSpan(style: inter14Gray3(), children: [
              const TextSpan(text: "Pilih "),
              TextSpan(
                  text: "m-Transfer > BCA Virtual Account",
                  style: inter14BoldGray3()),
            ]),
          ),
        ),
      ],
    ),
    const SizedBox(height: 4),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("2.", style: inter14Gray3()),
        Flexible(
          child: RichText(
            text: TextSpan(
              style: inter14Gray3(),
              children: [
                const TextSpan(text: "Masukkan nomor Virtual Account "),
                TextSpan(text: "438403430848 ", style: inter14BoldGray3()),
                const TextSpan(text: "lalu pilih "),
                TextSpan(text: "Send", style: inter14BoldGray3()),
              ],
            ),
          ),
        ),
      ],
    ),
    const SizedBox(height: 4),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("3.", style: inter14Gray3()),
        Flexible(
          child: RichText(
            text: TextSpan(
              style: inter14Gray3(),
              children: [
                const TextSpan(
                    text:
                        "Periksa informasi yang ditampilkan di layar, jika sudah benar pilih "),
                TextSpan(text: "Ya ", style: inter14BoldGray3()),
              ],
            ),
          ),
        ),
      ],
    ),
    const SizedBox(height: 4),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("4.", style: inter14Gray3()),
        Flexible(
          child: RichText(
            text: TextSpan(
              style: inter14Gray3(),
              children: [
                const TextSpan(text: "Masukkan PIN BCA Anda dan pilih "),
                TextSpan(text: "Ok ", style: inter14BoldGray3()),
              ],
            ),
          ),
        ),
      ],
    ),
    const SizedBox(height: 8),
  ];
}

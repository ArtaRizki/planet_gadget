import 'package:flutter/material.dart';
import 'package:planet_gadget/library/textstyle.dart';

import '../../../library/color.dart';
import '../../core/appbar_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: appBarWidget(title: "Notification", context: context),
        backgroundColor: white,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: RefreshIndicator(
            onRefresh: () {
              return refresh();
            },
            child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return notificationItem(
                        title: "To Pay",
                        description:
                            "Pembelian ID 0111010101 Anda sudah diproses segera lakukan pembayaran",
                        date: "15 Jun 2023");
                  }
                  return notificationItem(
                      title: "Store Information",
                      description:
                          "Perubahan informasi yang menarik! Harga Iphone XR naik dari 1M ke 1,2M, tapi jangan khawatir karena spesifikasi handphone tetap sama.",
                      date: "15 Jun 2023");
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: 10),
          ),
        ),
      ),
    );
  }

  refresh() async {}

  Widget notificationItem(
      {required String title,
      required String description,
      required String date}) {
    return Container(
      height: 114,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: secondaryBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title, style: inter14Bold()),
                Text(date, style: inter14Bold()),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            flex: 8,
            child: Text(description,
                style: inter14Black2(),
                overflow: TextOverflow.ellipsis,
                maxLines: 3),
          ),
        ],
      ),
    );
  }
}

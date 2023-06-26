import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../library/color.dart';
import '../../../../library/loading.dart';
import '../../../../library/textstyle.dart';
import '../../../../utils/constants/path.dart';

class InformationStorePage extends StatefulWidget {
  const InformationStorePage({Key? key}) : super(key: key);

  @override
  State<InformationStorePage> createState() => _InformationStorePageState();
}

class _InformationStorePageState extends State<InformationStorePage> {
  late ScrollController _controller;
  bool sliverCollapsed = false;

  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        if (_controller.offset > 120 && !_controller.position.outOfRange) {
          {
            // do what ever you want when sliver is collapsing !

            // myTitle = "sliver collapsed !";
            sliverCollapsed = true;
            setState(() {});
          }
        }
        if (_controller.offset <= 120 && !_controller.position.outOfRange) {
          if (sliverCollapsed) {
            // do what ever you want when sliver is expanding !

            // myTitle = "sliver expanded !";
            sliverCollapsed = false;
            setState(() {});
          }
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        // physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            // collapsedHeight: 72,
            snap: true,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.1,
              titlePadding:
                  // sliverCollapsed
                  //     ?
                  // const EdgeInsets.fromLTRB(72, 0, 48, 23),
                  // :
                  const EdgeInsets.fromLTRB(0, 8, 48, 48),
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("${articlePath}information_store.jpg"),
                  ),
                ),
                // child: Stack(
                //   children: [
                //     Positioned(
                //       top: 70,
                //       left: 212,
                //       // right: 0,
                //       child: SizedBox(
                //         width: MediaQuery.of(context).size.width * 0.7,
                //         height: MediaQuery.of(context).size.width * 0.8,
                //         child: CachedNetworkImage(
                //           fit: BoxFit.cover,
                //           imageUrl:
                //               "$baseUrl/${dashboardModel!.pencapaian.badgeLevel.ikon}",
                //           placeholder: (context, url) =>
                //               const CircularProgressIndicator(),
                //           errorWidget: (context, url, error) =>
                //               Text('Error ${error.toString()}'),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ),
              stretchModes: const <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            backgroundColor: white,
            automaticallyImplyLeading: false,
            title: Row(
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.navigate_before,
                      color: !sliverCollapsed ? white : black,
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text("Information Store",
                    style:
                        !sliverCollapsed ? inter20BoldWhite() : inter20Bold())
              ],
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Information Holiday Planet Gadget",
                      style: inter16Bold()),
                  const SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset("${iconsArticlePath}clock.svg"),
                      const SizedBox(width: 4),
                      Text("2023-06-22", style: inter12Black2()),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Menteri Perhubungan Budi Karya Sumadi menyatakan perubahan jadwal cuti bersama Lebaran itu diputuskan dalam rapat terbatas mengenai persiapan arus mudik yang dipimpin langsung Presiden Joko Widodo di Istana Kepresidenan, Jakarta, Jumat.'Bisa dikatakan karena diputuskan dalam ratas secara de facto terjadi, tinggal de jure kami usulkan kepada Pak Presiden dan saya rasa saya akan rapat dengan tiga kementerian itu,' kata Budi dalam jumpa pers selepas rapat terbatas.Menhub merujuk kepada Menteri Agama Yaqut Cholil Qoumas, Menteri Ketenagakerjaan Ida Fauziyah, serta Menteri Pendayagunaan Aparatur Negara dan Reformasi Birokrasi Abdullah Azwar Anas yang mengeluarkan SKB tentang Hari Libur Nasional dan Cuti Bersama Tahun 2023.",
                    // maxLines: 100.h.round(),
                    style: inter14MediumBlack2(),
                  ),
                ],
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     <Widget>[
          //       Padding(
          //         padding: const EdgeInsets.all(20),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: <Widget>[
          //             Text("Information Holiday Planet Gadget",
          //                 style: inter16Bold()),
          //             const SizedBox(height: 4),
          //             Row(
          //               children: <Widget>[
          //                 SvgPicture.asset("${iconsArticlePath}clock.svg"),
          //                 const SizedBox(width: 4),
          //                 Text("2023-06-22", style: inter12Black2()),
          //               ],
          //             ),
          //             const SizedBox(height: 6),
          //             Text(
          //               "Menteri Perhubungan Budi Karya Sumadi menyatakan perubahan jadwal cuti bersama Lebaran itu diputuskan dalam rapat terbatas mengenai persiapan arus mudik yang dipimpin langsung Presiden Joko Widodo di Istana Kepresidenan, Jakarta, Jumat.'Bisa dikatakan karena diputuskan dalam ratas secara de facto terjadi, tinggal de jure kami usulkan kepada Pak Presiden dan saya rasa saya akan rapat dengan tiga kementerian itu,' kata Budi dalam jumpa pers selepas rapat terbatas.Menhub merujuk kepada Menteri Agama Yaqut Cholil Qoumas, Menteri Ketenagakerjaan Ida Fauziyah, serta Menteri Pendayagunaan Aparatur Negara dan Reformasi Birokrasi Abdullah Azwar Anas yang mengeluarkan SKB tentang Hari Libur Nasional dan Cuti Bersama Tahun 2023.",
          //               maxLines: 100.h.round(),
          //               style: inter14MediumBlack2(),
          //               // maxLines: null,
          //               overflow: TextOverflow.ellipsis,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

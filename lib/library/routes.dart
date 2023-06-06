// import 'package:flutter/material.dart';
// import 'package:mgresto/models/history_langganan.dart';
// import 'package:mgresto/models/menu.dart';
// import 'package:mgresto/models/paket.dart';
// import 'package:mgresto/models/paket_detail.dart';
// import 'package:mgresto/views/detail_history_langganan_view.dart';
// import 'package:mgresto/views/history_langganan_view.dart';
// import 'package:mgresto/views/katalog_paket_makanan/add_paket_menu_view.dart';
// import 'package:mgresto/views/katalog_paket_makanan/add_paket_view.dart';
// import 'package:mgresto/views/katalog_paket_makanan/edit_add_paket_menu_view.dart';
// import 'package:mgresto/views/katalog_paket_makanan/edit_paket_menu.dart';
// import 'package:mgresto/views/katalog_paket_makanan/edit_paket_menu_view.dart';
// import 'package:mgresto/views/katalog_paket_makanan/edit_paket_view.dart';
// import 'package:mgresto/views/katalog_paket_makanan/history_harga_paket_view.dart';
// import 'package:mgresto/views/katalog_paket_makanan/paket_makanan_view.dart';
// import 'package:mgresto/views/history_harga_menu_view.dart';
// import 'package:mgresto/views/katalog_paket_makanan/search_paket_view.dart';
// import 'package:mgresto/views/kategori_view.dart';
// import 'package:mgresto/views/landing_view.dart';
// import 'package:mgresto/views/menu_view.dart';
// import 'package:mgresto/views/menunggu_pembayaran_view.dart';
// import 'package:mgresto/views/paket_langganan_view.dart';
// import 'package:mgresto/views/search_kategori_view.dart';
// import 'package:mgresto/views/katalog_paket_makanan/view_paket_makanan_view.dart';
// import '../main.dart';
// import '../models/paket_langganan_model.dart';
// import '../views/add_kategori_view.dart';
// import '../views/add_menu_view.dart';
// import '../views/detail_pembayaran_view.dart';
// import '../views/edit_kategori_view.dart';
// import '../views/edit_menu_view.dart';
// import '../views/home_view.dart';
// import '../views/login_view.dart';
// import '../views/pembayaran_view.dart';
// import '../views/register_view.dart';
// import '../views/search_menu_view.dart';
// import '../views/view_menu_view.dart';

// class Routes {
//   loginView() => Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               LoginView.create()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));

//   registerView(String registerType,
//           {String? emailFromGoogle, namaFromGoogle, noHpFromGoogle}) =>
//       Navigator.push(
//           navigatorKey.currentState!.context,
//           PageRouteBuilder(
//               pageBuilder: ((context, animation, secondaryAnimation) =>
//                   RegisterView.create(registerType,
//                       emailFromGoogle: emailFromGoogle,
//                       namaFromGoogle: namaFromGoogle,
//                       noHpFromGoogle: noHpFromGoogle)),
//               transitionDuration: const Duration(seconds: 0),
//               reverseTransitionDuration: Duration.zero));

//   landingView() => Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               const LandingView()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));

//   Future<void> homeView(BuildContext context, {String? loginType}) async {
//     await Navigator.push(
//         context,
//         PageRouteBuilder(
//             pageBuilder: ((context, animation, secondaryAnimation) =>
//                 HomeView(loginType: loginType)),
//             transitionDuration: const Duration(seconds: 0),
//             reverseTransitionDuration: Duration.zero));
//   }

//   Future<void> homeViewRemoveUntil(BuildContext context,
//       {String? loginType}) async {
//     await Navigator.pushAndRemoveUntil(
//         context,
//         PageRouteBuilder(
//             pageBuilder: ((context, animation, secondaryAnimation) =>
//                 HomeView(loginType: loginType)),
//             transitionDuration: const Duration(seconds: 0),
//             reverseTransitionDuration: Duration.zero),
//         (Route<dynamic> route) => false);
//   }

//   Future<void> pembayaranView(
//           BuildContext context, PaketItem paketItem) async =>
//       await Navigator.push(
//           context,
//           PageRouteBuilder(
//               pageBuilder: ((context, animation, secondaryAnimation) =>
//                   PembayaranView.create(paketItem)),
//               transitionDuration: const Duration(seconds: 0),
//               reverseTransitionDuration: Duration.zero));

//   Future<void> detailPembayaranView(
//           BuildContext context, PaketItem paketItem) async =>
//       await Navigator.pushReplacement(
//           context,
//           PageRouteBuilder(
//               pageBuilder: ((context, animation, secondaryAnimation) =>
//                   DetailPembayaranView.create(paketItem)),
//               transitionDuration: const Duration(seconds: 0),
//               reverseTransitionDuration: Duration.zero));

//   Future<void> detailHistoryLanggananView(
//           BuildContext context, HistoryLanggananModel paketItem) async =>
//       await Navigator.push(
//           context,
//           PageRouteBuilder(
//               pageBuilder: ((context, animation, secondaryAnimation) =>
//                   DetailHistoryLanggananView.create(paketItem)),
//               transitionDuration: const Duration(seconds: 0),
//               reverseTransitionDuration: Duration.zero));

//   kategoriView() => Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               KategoriView.create()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));

//   menuView() => Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               MenuView.create()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));
//   paketView() => Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               PaketMakananView.create()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));

//   Future<void> addKategoriView() async => await Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               AddKategoriView.create()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));
//   Future<void> addPaketView() async => await Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               AddPaketView.create()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));
//   Future<void> addDetailPaketView() async => await Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               AddDetailPaket.create()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));
//   Future<void> editDetailPaketView() async => await Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               EditDetailPaket.create()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));

//   Future<void> addMenuView(BuildContext context) async => await Navigator.push(
//       context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               AddMenuView.create()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));

//   Future<void> viewMenuView(MenuModel menu, BuildContext context) async {
//     await Navigator.push(
//         context,
//         PageRouteBuilder(
//             pageBuilder: ((context, animation, secondaryAnimation) =>
//                 ViewMenuView(menu: menu)),
//             transitionDuration: const Duration(seconds: 0),
//             reverseTransitionDuration: Duration.zero));
//   }

//   Future<void> viewPaketView({
//     required BuildContext context,
//     required int paketMenuId,
//   }) async {
//     await Navigator.push(
//         navigatorKey.currentState!.context,
//         PageRouteBuilder(
//             pageBuilder: ((context, animation, secondaryAnimation) =>
//                 ViewPaketView.create(
//                   paketMenuId: paketMenuId,
//                 )),
//             transitionDuration: const Duration(seconds: 0),
//             reverseTransitionDuration: Duration.zero));
//   }

//   Future<void> editPaketView({
//     required BuildContext context,
//     required int paketMenuId,
//     required int paketMenuIndex,
//   }) async {
//     await Navigator.push(
//         navigatorKey.currentState!.context,
//         PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               EditPaketView.create(
//                 paketMenuId: paketMenuId,
//                 paketMenuIndex: paketMenuIndex,
//               )),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero,
//         ));
//   }

//   Future<void> editKategoriView(int index, int kategoriID, String namaKategori,
//       BuildContext context) async {
//     await Navigator.push(
//         context,
//         PageRouteBuilder(
//             pageBuilder: ((context, animation, secondaryAnimation) =>
//                 EditKategoriView.create(index, kategoriID, namaKategori)),
//             transitionDuration: const Duration(seconds: 0),
//             reverseTransitionDuration: Duration.zero));
//   }

//   Future<void> editMenuView(int index, BuildContext context) async {
//     await Navigator.push(
//         context,
//         PageRouteBuilder(
//             pageBuilder: ((context, animation, secondaryAnimation) =>
//                 EditMenuView.create(index)),
//             transitionDuration: const Duration(seconds: 0),
//             reverseTransitionDuration: Duration.zero));
//   }

//   Future<void> editPaketMenuTempView(int index, BuildContext context) async {
//     await Navigator.push(
//         context,
//         PageRouteBuilder(
//             pageBuilder: ((context, animation, secondaryAnimation) =>
//                 EditPaketMenuTempView.create(index)),
//             transitionDuration: const Duration(seconds: 0),
//             reverseTransitionDuration: Duration.zero));
//   }

//   Future<void> editPaketMenuView({
//     required int indexMenu,
//     required int indexPaket,
//     required BuildContext context,
//   }) async {
//     await Navigator.push(
//         context,
//         PageRouteBuilder(
//             pageBuilder: ((context, animation, secondaryAnimation) =>
//                 EditPaketMenuView.create(
//                     indexMenu: indexMenu, indexPaket: indexPaket)),
//             transitionDuration: const Duration(seconds: 0),
//             reverseTransitionDuration: Duration.zero));
//   }

//   Future<void> historyHargaMenuView(int index, BuildContext context) async {
//     await Navigator.push(
//         context,
//         PageRouteBuilder(
//             pageBuilder: ((context, animation, secondaryAnimation) =>
//                 HistoryHargaMenuView.create(index)),
//             transitionDuration: const Duration(seconds: 0),
//             reverseTransitionDuration: Duration.zero));
//   }

//   Future<void> historyLanggananView(BuildContext context) async {
//     await Navigator.push(
//         context,
//         PageRouteBuilder(
//             pageBuilder: ((context, animation, secondaryAnimation) =>
//                 HistoryLanggananView.create()),
//             transitionDuration: const Duration(seconds: 0),
//             reverseTransitionDuration: Duration.zero));
//   }

//   Future<void> menungguPembayaranView(BuildContext context) async {
//     await Navigator.push(
//         context,
//         PageRouteBuilder(
//             pageBuilder: ((context, animation, secondaryAnimation) =>
//                 MenungguPembayaranView.create()),
//             transitionDuration: const Duration(seconds: 0),
//             reverseTransitionDuration: Duration.zero));
//   }

//   Future<void> historyHargaPaketView(
//       {required PaketModel paketIndex, required BuildContext context}) async {
//     await Navigator.push(
//         context,
//         PageRouteBuilder(
//             pageBuilder: ((context, animation, secondaryAnimation) =>
//                 HistoryHargaPaketView.create(paketIndex)),
//             transitionDuration: const Duration(seconds: 0),
//             reverseTransitionDuration: Duration.zero));
//   }

//   Future<void> searchKategoriView() async => await Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               SearchKategoriView.create()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));

//   Future<void> searchMenuView() async => await Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               SearchMenuView.create()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));

//   Future<void> searchPaketView() async => await Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               SearchPaketView.create()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));

//   Future<void> paketLanggananView() async => await Navigator.push(
//       navigatorKey.currentState!.context,
//       PageRouteBuilder(
//           pageBuilder: ((context, animation, secondaryAnimation) =>
//               const PaketLanggananView()),
//           transitionDuration: const Duration(seconds: 0),
//           reverseTransitionDuration: Duration.zero));

//   // navScreen(bool showStatus, int indexTab) {
//   //   Navigator.pushReplacement(
//   //     navigatorKey.currentState!.context,
//   //     PageRouteBuilder(
//   //       pageBuilder: ((context, animation, secondaryAnimation) =>
//   //           NavigationScreen(showStatus: showStatus, indexTab: indexTab)),
//   //       transitionDuration: const Duration(seconds: 0),
//   //       reverseTransitionDuration: Duration.zero,
//   //     ),
//   //   );
//   // }

//   // maintenanceScreen() {
//   //   Navigator.pushReplacement(
//   //     navigatorKey.currentState!.context,
//   //     PageRouteBuilder(
//   //       pageBuilder: ((context, animation, secondaryAnimation) =>
//   //           const MaintenancePage()),
//   //       transitionDuration: const Duration(seconds: 0),
//   //       reverseTransitionDuration: Duration.zero,
//   //     ),
//   //   );
//   // }

//   // loginScreenPushReplace() {
//   //   Navigator.pushReplacement(
//   //     navigatorKey.currentState!.context,
//   //     PageRouteBuilder(
//   //       pageBuilder: ((context, animation, secondaryAnimation) =>
//   //           const LoginScreen()),
//   //       transitionDuration: const Duration(seconds: 0),
//   //       reverseTransitionDuration: Duration.zero,
//   //     ),
//   //   );
//   // }

//   // loginScreenPushRemoveUntil() {
//   //   Navigator.pushAndRemoveUntil(
//   //     navigatorKey.currentState!.context,
//   //     PageRouteBuilder(
//   //       pageBuilder: ((context, animation, secondaryAnimation) =>
//   //           const LoginScreen()),
//   //       transitionDuration: const Duration(seconds: 0),
//   //       reverseTransitionDuration: Duration.zero,
//   //     ),
//   //     (route) => false,
//   //   );
//   // }

//   // forgotPassScreen(GeneralVersionModel generalVersionModel) {
//   //   Navigator.push(
//   //     navigatorKey.currentState!.context,
//   //     PageRouteBuilder(
//   //       pageBuilder: (context, animation1, animation2) => ForgotPasswordScreen(
//   //         versionName: generalVersionModel.detailFooter.isEmpty
//   //             ? ""
//   //             : generalVersionModel.detailFooter[0],
//   //         copyright: generalVersionModel.detailFooter.isEmpty
//   //             ? ""
//   //             : generalVersionModel.detailFooter[1],
//   //       ),
//   //       transitionDuration: const Duration(seconds: 0),
//   //       reverseTransitionDuration: Duration.zero,
//   //     ),
//   //   );
//   // }

//   // jobNowSearchScreen(AuthController authController) {
//   //   Navigator.push(
//   //     navigatorKey.currentState!.context,
//   //     PageRouteBuilder(
//   //       pageBuilder: (context, animation1, animation2) => JobNowSearchScreen(
//   //           color: Color(int.parse(
//   //         '0xff' + authController.user.data!.partner!.color.toString(),
//   //       ))),
//   //       transitionDuration: const Duration(seconds: 0),
//   //       reverseTransitionDuration: Duration.zero,
//   //     ),
//   //   );
//   // }

//   // jobDoneSearchScreen(AuthController authController) {
//   //   Navigator.push(
//   //     navigatorKey.currentState!.context,
//   //     PageRouteBuilder(
//   //       pageBuilder: (context, animation1, animation2) => JobDoneSearchScreen(
//   //           color: Color(int.parse(
//   //         '0xff' + authController.user.data!.partner!.color.toString(),
//   //       ))),
//   //       transitionDuration: const Duration(seconds: 0),
//   //       reverseTransitionDuration: Duration.zero,
//   //     ),
//   //   );
//   // }

//   // jobNowScreen(int index, List<Datum>? jobListNowList, bool isRefresh,
//   //     TrackingFormModel trackingFormModel) {
//   //   Navigator.push(
//   //     navigatorKey.currentState!.context,
//   //     PageRouteBuilder(
//   //       pageBuilder: (context, animation1, animation2) => JobNowScreen(
//   //         index: index,
//   //         jobListNowList: jobListNowList,
//   //         isRefresh: isRefresh,
//   //         trackingFormModel: trackingFormModel,
//   //       ),
//   //       transitionDuration: const Duration(seconds: 0),
//   //       reverseTransitionDuration: Duration.zero,
//   //     ),
//   //   );
//   // }

//   // jobNowScreenPushReplacement(int index, List<Datum>? jobListNowList,
//   //     bool isRefresh, TrackingFormModel trackingFormModel) {
//   //   Navigator.pushReplacement(
//   //     navigatorKey.currentState!.context,
//   //     PageRouteBuilder(
//   //       pageBuilder: (context, animation1, animation2) => JobNowScreen(
//   //         index: index,
//   //         jobListNowList: jobListNowList,
//   //         isRefresh: isRefresh,
//   //         trackingFormModel: trackingFormModel,
//   //       ),
//   //       transitionDuration: const Duration(seconds: 0),
//   //       reverseTransitionDuration: Duration.zero,
//   //     ),
//   //   );
//   // }

//   // jobDoneScreen(int index, List<d.Datum>? jobListDoneList) {
//   //   Navigator.push(
//   //     navigatorKey.currentState!.context,
//   //     PageRouteBuilder(
//   //       pageBuilder: (context, animation1, animation2) => JobDoneScreen(
//   //         index: index,
//   //         jobListDoneList: jobListDoneList,
//   //       ),
//   //       transitionDuration: const Duration(seconds: 0),
//   //       reverseTransitionDuration: Duration.zero,
//   //     ),
//   //   );
//   // }

//   // imageView(List<XFile>? image, int indexActive) {
//   //   Navigator.push(
//   //     navigatorKey.currentState!.context,
//   //     PageRouteBuilder(
//   //       pageBuilder: ((context, animation, secondaryAnimation) =>
//   //           ImageView(image: image, indexActive: indexActive)),
//   //       transitionDuration: const Duration(seconds: 0),
//   //       reverseTransitionDuration: Duration.zero,
//   //     ),
//   //   );
//   // }

//   // Future<XFile?> cameraScreen() async {
//   //   return await Navigator.push(
//   //     navigatorKey.currentState!.context,
//   //     PageRouteBuilder(
//   //       pageBuilder: (context, animation1, animation2) => const CameraScreen(),
//   //     ),
//   //   );
//   // }
// }

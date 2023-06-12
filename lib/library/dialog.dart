// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:mgresto/main.dart';
// import 'package:mgresto/providers/register_provider.dart';
// import 'package:mgresto/services/user_service.dart';
// import 'color.dart';
// import 'textstyle.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:provider/provider.dart';
// import '../plugins/drop_down_list/drop_down_list.dart';
// import '../plugins/drop_down_list/model/selected_list_item.dart';
// import '../providers/countdown_timer_provider.dart';

// Future<void> otpWindow(BuildContext context, Function()? nextStep,
//     String otpType, String typeValue,
//     {bool? isTwice}) async {
//   final rp = Provider.of<RegisterProvider>(context, listen: false);
//   log("OTP TYPE : $otpType");
//   String text1 = otpType == "Telepon" ? "nomor" : "email";
//   String text2 = otpType == "Telepon" ? "Handphone" : "Email";
//   String strDigits(int n) => n.toString().padLeft(2, '0');
//   bool otpInvalid = false;
//   String otp = "";
//   UserService userService = UserService();
//   await showDialog(
//           context: context,
//           builder: (context) => WillPopScope(
//                 onWillPop: () async => true,
//                 child: AlertDialog(
//                   title: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Verifikasi Kode OTP', style: inter22Bold()),
//                       InkWell(
//                           onTap: () {
//                             if (otpType == "Telepon") {
//                               rp.batalOtpTelepon = true;
//                             }
//                             Navigator.pop(context);
//                           },
//                           child: const SizedBox(
//                               width: 24, height: 24, child: Icon(Icons.close)))
//                     ],
//                   ),
//                   content: SizedBox(
//                     width: MediaQuery.of(context).size.height,
//                     child: Consumer<CountDownTimerProvider>(
//                       builder: (context, value, child) => Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Padding(
//                               padding: const EdgeInsets.only(bottom: 20),
//                               child: otpInvalid
//                                   ? Text("OTP tidak sesuai",
//                                       style: TextStyle(color: Colors.red))
//                                   : Text(value.msg,
//                                       style: TextStyle(color: value.colorMsg))),
//                           const Padding(
//                               padding: EdgeInsets.only(bottom: 2),
//                               child: Text('Masukkan kode OTP yang telah kami')),
//                           Padding(
//                               padding: const EdgeInsets.only(bottom: 16),
//                               child: Text('kirimkan ke $text1 $typeValue')),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8),
//                             child: PinCodeTextField(
//                               appContext: context,
//                               length: 4,
//                               onChanged: (val) => otp = val,
//                               autoFocus: true,
//                               animationType: AnimationType.scale,
//                               keyboardType: TextInputType.number,
//                               useHapticFeedback: true,
//                               hapticFeedbackTypes:
//                                   HapticFeedbackTypes.selection,
//                               pinTheme: PinTheme(
//                                 shape: PinCodeFieldShape.box,
//                                 borderRadius: BorderRadius.circular(6),
//                                 fieldHeight: 50,
//                                 fieldWidth: 50,
//                                 borderWidth: 1,
//                                 activeFillColor: Colors.white,
//                                 activeColor: primaryYellow,
//                                 errorBorderColor: Colors.red,
//                                 selectedColor: primaryYellow,
//                                 inactiveColor: gray,
//                               ),
//                               cursorColor: primaryYellow,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 4, bottom: 4),
//                             child: Text(
//                                 '${strDigits(value.myDuration.inMinutes.remainder(60))}.${strDigits(value.myDuration.inSeconds.remainder(60))}'),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(bottom: 18),
//                             child: InkWell(
//                                 onTap: () => value.resendOtp(
//                                     context: context, viaOtp: text2),
//                                 child: Text('Resend OTP',
//                                     style: TextStyle(
//                                         decoration: TextDecoration.underline,
//                                         color: !value.isRunning
//                                             ? hyperlinkBlue
//                                             : gray))),
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width,
//                             height: 60,
//                             padding: const EdgeInsets.only(bottom: 18),
//                             child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     onPrimary: tertiaryYellow,
//                                     primary: !value.isRunning ? gray : Yellow5,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(6))),
//                                 onPressed: !value.isRunning
//                                     ? null
//                                     : () async {
//                                         bool verifyOtp = await userService
//                                             .verifyOtp(context, otp, text2);
//                                         if (verifyOtp) {
//                                           otpInvalid = false;
//                                           await successWindow(
//                                               context,
//                                               otpType,
//                                               isTwice == true
//                                                   ? null
//                                                   : nextStep);
//                                         } else {
//                                           otpInvalid = true;
//                                         }
//                                       },
//                                 child:
//                                     Text('Verifikasi', style: inter18Medium())),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   insetPadding: const EdgeInsets.symmetric(horizontal: 15),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0)),
//                   titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
//                   actionsPadding: const EdgeInsets.only(right: 10, bottom: 5),
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//                 ),
//               ),
//           barrierDismissible: otpType == "Telepon" ? false : true)
//       .then((value) =>
//           Provider.of<CountDownTimerProvider>(context, listen: false)
//               .resetTimer());
// }

// Future<void> successWindow(
//     BuildContext context, String txt, Function()? nextStep) async {
//   txt = txt == "Telepon" ? "Nomor Telepon" : "Email";
//   await showDialog(
//       barrierColor: Colors.transparent,
//       context: context,
//       builder: (context) => AlertDialog(
//             content: SizedBox(
//               width: MediaQuery.of(context).size.height,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const SizedBox(height: 32),
//                   Container(
//                     padding: const EdgeInsets.only(bottom: 24, top: 32),
//                     width: 80,
//                     height: 80,
//                     child: FittedBox(
//                         child: Image.asset('assets/images/check-circle.png',
//                             width: 80, height: 80)),
//                   ),
//                   const SizedBox(height: 24),
//                   Text("Verifikasi $txt Sukses", style: inter22BoldYellow()),
//                   const SizedBox(height: 16),
//                   Center(
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Text(txt.contains("Email")
//                           ? "Setelah ini silahkan lengkapi data resto Anda"
//                           : "Setelah ini silahkan lakukan verifikasi email proses ini bisa Anda lewati"),
//                     ),
//                   ),
//                   const SizedBox(height: 48),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 60,
//                     padding: const EdgeInsets.only(bottom: 18),
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             onPrimary: tertiaryYellow,
//                             primary: Yellow5,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6))),
//                         onPressed: () {
//                           Navigator.pop(context);
//                           Navigator.pop(context);
//                           if (nextStep != null) {
//                             nextStep();
//                           }
//                         },
//                         child: Text('Lanjut', style: inter18Medium())),
//                   ),
//                 ],
//               ),
//             ),
//             insetPadding: const EdgeInsets.symmetric(horizontal: 15),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5.0)),
//             titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
//             actionsPadding: const EdgeInsets.only(right: 10, bottom: 5),
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           ),
//       barrierDismissible: true);
// }

// void showSearchSheet(String title, List<SelectedListItem> _listItem,
//     Function(List<dynamic> selectedList) onSelected) {
//   DropDownState(DropDown(
//     title: title,
//     bottomSheetTitle: Text(title, style: inter28Bold()),
//     data: _listItem,
//     selectedItems: onSelected,
//     enableMultipleSelection: false,
//   )).showModal(navigatorKey.currentContext);
// }

// void showSheet(String title, List<SelectedListItem> _listItem,
//     Function(List<dynamic> selectedList) onSelected,
//     {List<String>? iconList, List<bool>? enabled}) {
//   DropDownState(DropDown(
//     isSearchVisible: false,
//     title: title,
//     bottomSheetTitle: Text(
//       title,
//       style: inter28Bold(),
//       overflow: TextOverflow.ellipsis,
//       maxLines: 1,
//     ),
//     data: _listItem,
//     selectedItems: onSelected,
//     enableMultipleSelection: false,
//     iconList: iconList,
//     enabledList: enabled,
//   )).showModal(navigatorKey.currentContext);
// }

// categoryDialog(
//         {required String title,
//         required String itemName,
//         required String imagePath,
//         required String buttonName,
//         required Function? onTap}) =>
//     showGeneralDialog(
//       barrierLabel: "Label",
//       barrierDismissible: false,
//       barrierColor: Colors.black.withOpacity(0.5),
//       context: navigatorKey.currentContext!,
//       pageBuilder: (context, anim1, anim2) {
//         return AlertDialog(
//           contentPadding: const EdgeInsets.all(12),
//           insetPadding: const EdgeInsets.symmetric(horizontal: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: InkWell(
//                   onTap: () => Navigator.pop(context),
//                   child: const Icon(Icons.close),
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(image: AssetImage(imagePath))),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
//                 child: Column(
//                   children: [
//                     Text(
//                       title,
//                       style: inter12MediumGray(),
//                       textAlign: TextAlign.center,
//                     ),
//                     Text(
//                       " $itemName ?",
//                       style: inter12BoldBlack(),
//                       maxLines: null,
//                       softWrap: true,
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 4.0),
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shadowColor: Colors.white,
//                               fixedSize:
//                                   Size(MediaQuery.of(context).size.width, 40),
//                               primary: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                   side: BorderSide(color: Yellow5),
//                                   borderRadius: BorderRadius.circular(6))),
//                           onPressed: () => Navigator.pop(context),
//                           child: Text('Batal', style: inter16Medium())),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 4.0),
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shadowColor: Colors.transparent,
//                               fixedSize:
//                                   Size(MediaQuery.of(context).size.width, 40),
//                               primary: Yellow5,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(6))),
//                           onPressed: () {
//                             onTap!();
//                             Navigator.pop(context);
//                           },
//                           child: Text(buttonName, style: inter16Medium())),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 4),
//             ],
//           ),
//         );
//       },
//     );

// paketDialog(
//         {required String title,
//         required String itemName,
//         required String imagePath,
//         required String buttonName,
//         required Function? onTap}) =>
//     showGeneralDialog(
//       barrierLabel: "Label",
//       barrierDismissible: false,
//       barrierColor: Colors.black.withOpacity(0.5),
//       context: navigatorKey.currentContext!,
//       pageBuilder: (context, anim1, anim2) {
//         return AlertDialog(
//           contentPadding: const EdgeInsets.all(12),
//           insetPadding: const EdgeInsets.symmetric(horizontal: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: InkWell(
//                   onTap: () => Navigator.pop(context),
//                   child: const Icon(Icons.close),
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(image: AssetImage(imagePath))),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
//                 child: Column(
//                   children: [
//                     Text(
//                       title,
//                       style: inter12MediumGray(),
//                       textAlign: TextAlign.center,
//                     ),
//                     Text(
//                       " $itemName ?",
//                       style: inter12BoldBlack(),
//                       maxLines: null,
//                       softWrap: true,
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 4.0),
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shadowColor: Colors.white,
//                               fixedSize:
//                                   Size(MediaQuery.of(context).size.width, 40),
//                               primary: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                   side: BorderSide(color: Yellow5),
//                                   borderRadius: BorderRadius.circular(6))),
//                           onPressed: () => Navigator.pop(context),
//                           child: Text('Batal', style: inter16Medium())),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 4.0),
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shadowColor: Colors.transparent,
//                               fixedSize:
//                                   Size(MediaQuery.of(context).size.width, 40),
//                               primary: Yellow5,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(6))),
//                           onPressed: () {
//                             onTap!();
//                             Navigator.pop(context);
//                           },
//                           child: Text(buttonName, style: inter16Medium())),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 4),
//             ],
//           ),
//         );
//       },
//     );

// tagihanDialog(
//         {required String title,
//         required String itemName,
//         required String imagePath,
//         required String buttonName,
//         required Function? onTap}) =>
//     showGeneralDialog(
//       barrierLabel: "Label",
//       barrierDismissible: false,
//       barrierColor: Colors.black.withOpacity(0.5),
//       context: navigatorKey.currentContext!,
//       pageBuilder: (context, anim1, anim2) {
//         return AlertDialog(
//           contentPadding: const EdgeInsets.all(12),
//           insetPadding: const EdgeInsets.symmetric(horizontal: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: InkWell(
//                   onTap: () => Navigator.pop(context),
//                   child: const Icon(Icons.close),
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(image: AssetImage(imagePath))),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
//                 child: Column(
//                   children: [
//                     Text(
//                       title,
//                       style: inter12MediumGray(),
//                       textAlign: TextAlign.center,
//                     ),
//                     Text(
//                       " $itemName ?",
//                       style: inter12BoldBlack(),
//                       maxLines: null,
//                       softWrap: true,
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 4.0),
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shadowColor: Colors.white,
//                               fixedSize:
//                                   Size(MediaQuery.of(context).size.width, 40),
//                               primary: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                   side: BorderSide(color: Yellow5),
//                                   borderRadius: BorderRadius.circular(6))),
//                           onPressed: () => Navigator.pop(context),
//                           child: Text('Batal', style: inter16Medium())),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 4.0),
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shadowColor: Colors.transparent,
//                               fixedSize:
//                                   Size(MediaQuery.of(context).size.width, 40),
//                               primary: Yellow5,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(6))),
//                           onPressed: () {
//                             onTap!();
//                             Navigator.pop(context);
//                           },
//                           child: Text(buttonName, style: inter16Medium())),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 4),
//             ],
//           ),
//         );
//       },
//     );

// void transferDialog(
//         {required String title,
//         required String itemName,
//         required String imagePath,
//         required String buttonName,
//         required Function? onTap}) =>
//     showGeneralDialog(
//       barrierLabel: "Label",
//       barrierDismissible: false,
//       barrierColor: Colors.black.withOpacity(0.5),
//       context: navigatorKey.currentContext!,
//       pageBuilder: (context, anim1, anim2) {
//         return AlertDialog(
//           contentPadding: const EdgeInsets.all(12),
//           insetPadding: const EdgeInsets.symmetric(horizontal: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: InkWell(
//                   onTap: () => Navigator.pop(context),
//                   child: const Icon(Icons.close),
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(image: AssetImage(imagePath))),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
//                 child: Column(
//                   children: [
//                     Text(
//                       title,
//                       style: inter14Medium(),
//                       textAlign: TextAlign.center,
//                     ),
//                     Text(
//                       " $itemName ?",
//                       style: inter14Medium(),
//                       maxLines: null,
//                       softWrap: true,
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 4.0),
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shadowColor: Colors.white,
//                               fixedSize:
//                                   Size(MediaQuery.of(context).size.width, 40),
//                               primary: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                   side: BorderSide(color: Yellow5),
//                                   borderRadius: BorderRadius.circular(6))),
//                           onPressed: () => Navigator.pop(context),
//                           child: Text('Batal', style: inter16Medium())),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 4.0),
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               shadowColor: Colors.transparent,
//                               fixedSize:
//                                   Size(MediaQuery.of(context).size.width, 40),
//                               primary: Yellow5,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(6))),
//                           onPressed: () => onTap!(),
//                           child: Text(buttonName, style: inter16Medium())),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 4),
//             ],
//           ),
//         );
//       },
//     );

// void transferProgressDialog(
//   BuildContext context, {
//   required String title,
//   required int number,
//   required int total,
// }) {
//   Navigator.pop(context);
//   showGeneralDialog(
//     barrierLabel: "Label",
//     barrierDismissible: false,
//     barrierColor: Colors.black.withOpacity(0.5),
//     context: navigatorKey.currentContext!,
//     transitionDuration: Duration.zero,
//     pageBuilder: (context, anim1, anim2) {
//       return AlertDialog(
//         contentPadding: const EdgeInsets.all(12),
//         insetPadding: const EdgeInsets.symmetric(horizontal: 16),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text("Transfer Data", style: inter14Bold()),
//             Container(
//               margin: const EdgeInsets.only(top: 9, bottom: 16),
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   color: const Color(0xff88D8CA),
//                   borderRadius: BorderRadius.circular(40)),
//               height: 12,
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     flex: (number / total).round(),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(40),
//                           color: primaryYellow),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 13),
//                         child: Text("${(number / total).round() * 100}%",
//                             style: inter10Normal()),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                       flex: 10 - ((number / total).round()),
//                       child: const SizedBox())
//                 ],
//               ),
//             ),
//             const SizedBox(height: 4),
//           ],
//         ),
//       );
//     },
//   );
// }
    

// // void showClearDialogPackaging(indexVariasi) {
// //   showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text(
// //             'Confirmation',
// //             textScaleFactor: 1.0,
// //           ),
// //           content: Container(
// //             child: Text(
// //               "Apakah Anda yakin ingin menghapus barang ini dari keranjang belanja?",
// //               textScaleFactor: 1.0,
// //             ),
// //           ),
// //           actions: <Widget>[
// //             FlatButton(
// //               onPressed: () async {
// //                 Get.back();
// //                 _setQtyPackaging(indexVariasi, "0");
// //               },
// //               child: Text(
// //                 'Ya',
// //                 textScaleFactor: 1.0,
// //                 style: TextStyle(color: Colors.black),
// //               ),
// //             ),
// //             FlatButton(
// //               onPressed: () async {
// //                 Get.back();
// //               },
// //               child: Text('Tidak',
// //                   textScaleFactor: 1.0, style: TextStyle(color: Colors.black)),
// //             )
// //           ],
// //         );
// //       });

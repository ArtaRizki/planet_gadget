import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_gadget/application/account/edit_account_state.dart';
import 'package:planet_gadget/domain/entity/core/textfield_model.dart';
import 'package:planet_gadget/library/textstyle.dart';
import 'package:planet_gadget/presentation/core/appbar_widget.dart';
// import 'package:planet_gadget/application/account/edit_account_notifier.dart';

import '../../../application/account/edit_account_notifier.dart';
import '../../../library/color.dart';
import '../../../library/decoration.dart';
import '../../../utils/constants/path.dart';
import 'widgets/bottom_button.dart';
import 'widgets/field.dart';

class EditAccountPage extends ConsumerStatefulWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  ConsumerState<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends ConsumerState<EditAccountPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController ktpC = TextEditingController();
  TextEditingController phoneNumberC = TextEditingController();
  TextEditingController birthdayC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    EditAccountState state = ref.watch(editAccountNotifier);
    final editNotifier = ref.read(editAccountNotifier.notifier);
    TextFieldModel name = state.name,
        ktp = state.ktp,
        phoneNumber = state.phoneNumber,
        birthday = state.birthday;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        appBar: appBarWidget(title: "Setting", context: context),
        bottomNavigationBar: bottomButton(onClick: () {}),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: RefreshIndicator(
            onRefresh: () {
              return refresh();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Account", style: inter20Bold()),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: SvgPicture.asset(
                              '${iconsAccountPath}edit.svg',
                              width: 24,
                              height: 24,
                            ),
                          )
                        ],
                      ),
                    ),
                    field(
                      name: "Name",
                      value: "Yoshua",
                      hint: "Name",
                      controller: nameC,
                      empty: name.isEmpty,
                      error: name.errorMessage,
                      suggest: "Nama harus diisi",
                      onchanged: (val) {
                        state = state.copyWith(name: name.copyWith(value: val));
                        editNotifier.checkField(
                            val: name.value,
                            fieldEmpty: name.isEmpty,
                            fieldErrorMsg: name.errorMessage,
                            errorMsg: "Nama harus diisi",
                            onFieldEmpty: () {
                              log("NAMA ON FIELD");
                              state = state.copyWith(
                                  name: name.copyWith(isEmpty: true));
                            },
                            errorMessageSetter: (String msg) {
                              state = state.copyWith(
                                  name: name.copyWith(errorMessage: msg));
                            });
                      },
                    ),
                    field(
                      name: "KTP/SIM/Kitas",
                      value: "3502173009970010",
                      hint: "KTP/SIM/Kitas",
                      controller: ktpC,
                      empty: ktp.isEmpty,
                      error: ktp.errorMessage,
                      suggest: "KTP harus diisi",
                      onchanged: (val) {
                        state = state.copyWith(ktp: ktp.copyWith(value: val));
                        editNotifier.checkField(
                            val: ktp.value,
                            fieldEmpty: ktp.isEmpty,
                            fieldErrorMsg: ktp.errorMessage,
                            errorMsg: "KTP harus diisi",
                            onFieldEmpty: () {
                              state = state.copyWith(
                                  ktp: ktp.copyWith(isEmpty: true));
                            },
                            errorMessageSetter: (String msg) {
                              state = state.copyWith(
                                  ktp: ktp.copyWith(errorMessage: msg));
                            });
                      },
                    ),
                    field(
                      name: "Phone number",
                      value: "082233444849",
                      hint: "Phone number",
                      controller: phoneNumberC,
                      empty: phoneNumber.isEmpty,
                      error: phoneNumber.errorMessage,
                      suggest: "Nomor HP harus diisi",
                      onchanged: (val) {
                        state = state.copyWith(
                            phoneNumber: phoneNumber.copyWith(value: val));
                        editNotifier.checkField(
                            val: phoneNumber.value,
                            fieldEmpty: phoneNumber.isEmpty,
                            fieldErrorMsg: phoneNumber.errorMessage,
                            errorMsg: "Nomor HP harus diisi",
                            onFieldEmpty: () {
                              state = state.copyWith(
                                  phoneNumber:
                                      phoneNumber.copyWith(isEmpty: true));
                            },
                            errorMessageSetter: (String msg) {
                              state = state.copyWith(
                                  phoneNumber:
                                      phoneNumber.copyWith(errorMessage: msg));
                            });
                      },
                    ),
                    field(
                      name: "Birthday",
                      value: "30 September 1997",
                      hint: "Birthday",
                      controller: birthdayC,
                      empty: birthday.isEmpty,
                      error: birthday.errorMessage,
                      suggest: "Tanggal lahir harus diisi",
                      onchanged: (val) {
                        state = state.copyWith(
                            birthday: birthday.copyWith(value: val));
                        editNotifier.checkField(
                            val: birthday.value,
                            fieldEmpty: birthday.isEmpty,
                            fieldErrorMsg: birthday.errorMessage,
                            errorMsg: "Tanggal Lahir harus diisi",
                            onFieldEmpty: () {
                              state = state.copyWith(
                                  birthday: birthday.copyWith(isEmpty: true));
                            },
                            errorMessageSetter: (String msg) {
                              state = state.copyWith(
                                  birthday:
                                      birthday.copyWith(errorMessage: msg));
                            });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Gender", style: inter14Medium()),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 12),
                                decoration: BoxDecoration(
                                    color: secondaryBlue,
                                    border: Border.all(color: primaryBlue),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text("Male", style: inter14Medium()),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 12),
                                decoration: BoxDecoration(
                                    color: white,
                                    border: Border.all(color: primaryBlue),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text("Female", style: inter14Medium()),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget field(
  //     {required String name,
  //     required String value,
  //     required String hint,
  //     required String error,
  //     required bool empty,
  //     required TextEditingController controller,
  //     required Function(String)? onchanged}) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(name, style: inter14Medium()),
  //         const SizedBox(height: 8),
  //         TextFormField(
  //           controller: controller,
  //           autovalidateMode: AutovalidateMode.onUserInteraction,
  //           onChanged: (val) {},
  //           style: inter14Medium(),
  //           cursorColor: primaryBlue,
  //           decoration: generalDecoration(hint, error),
  //           scrollPadding: const EdgeInsets.only(bottom: 52),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(empty ? error : "", style: redValidateErrorRequired()),
  //         const SizedBox(height: 16),
  //       ],
  //     ),
  //   );
  // }

  refresh() {}
}

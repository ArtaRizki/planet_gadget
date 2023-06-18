import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_gadget/application/account/edit_account_state.dart';
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
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        appBar: appBarWidget(title: "Setting", context: context),
        bottomNavigationBar: bottomButton(onClick: () => editNotifier.login()),
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
                      empty: state.name.isEmpty,
                      error: state.name.errorMessage,
                      suggest: "Nama harus diisi",
                      onchanged: (val) {
                        state = state.copyWith(
                            name: state.name.copyWith(value: val));
                        editNotifier.checkField(
                            val: state.name.value,
                            fieldEmpty: state.name.isEmpty,
                            fieldErrorMsg: state.name.errorMessage,
                            errorMsg: "Nama harus diisi");
                      },
                    ),
                    field(
                      name: "KTP/SIM/Kitas",
                      value: "3502173009970010",
                      hint: "KTP/SIM/Kitas",
                      controller: ktpC,
                      empty: state.ktp.isEmpty,
                      error: state.ktp.errorMessage,
                      suggest: "KTP harus diisi",
                      onchanged: (val) {
                        editNotifier.checkField(
                            val: state.ktp.value,
                            fieldEmpty: state.ktp.isEmpty,
                            fieldErrorMsg: state.ktp.errorMessage,
                            errorMsg: "KTP harus diisi");
                      },
                    ),
                    field(
                      name: "Phone number",
                      value: "082233444849",
                      hint: "Phone number",
                      controller: phoneNumberC,
                      empty: state.phoneNumber.isEmpty,
                      error: state.phoneNumber.errorMessage,
                      suggest: "Nomor HP harus diisi",
                      onchanged: (val) {
                        editNotifier.checkField(
                            val: state.phoneNumber.value,
                            fieldEmpty: state.phoneNumber.isEmpty,
                            fieldErrorMsg: state.phoneNumber.errorMessage,
                            errorMsg: "Nomor HP harus diisi");
                      },
                    ),
                    field(
                      name: "Birthday",
                      value: "30 September 1997",
                      hint: "Birthday",
                      controller: birthdayC,
                      empty: state.birthday.isEmpty,
                      error: state.birthday.errorMessage,
                      suggest: "Tanggal lahir harus diisi",
                      onchanged: (val) {
                        editNotifier.checkField(
                            val: state.birthday.value,
                            fieldEmpty: state.birthday.isEmpty,
                            fieldErrorMsg: state.birthday.errorMessage,
                            errorMsg: "Tanggal Lahir harus diisi");
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

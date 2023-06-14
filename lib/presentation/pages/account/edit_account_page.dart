import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_gadget/library/textstyle.dart';
import 'package:planet_gadget/presentation/core/appbar_widget.dart';

import '../../../library/color.dart';
import '../../../library/decoration.dart';
import '../../../utils/constants/path.dart';

class EditAccountPage extends StatefulWidget {
  EditAccountPage({Key? key}) : super(key: key);

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController ktpC = TextEditingController();
  TextEditingController phoneNumberC = TextEditingController();
  TextEditingController birthdayC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        appBar: appBarWidget(title: "Setting", context: context),
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
                        controller: nameC),
                    field(
                        name: "KTP/SIM/Kitas",
                        value: "3502173009970010",
                        hint: "KTP/SIM/Kitas",
                        controller: ktpC),
                    field(
                        name: "Phone number",
                        value: "082233444849",
                        hint: "Phone number",
                        controller: phoneNumberC),
                    field(
                        name: "Birthday",
                        value: "30 September 1997",
                        hint: "Birthday",
                        controller: birthdayC),
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

  refresh() {}

  Widget field(
      {required String name,
      required String value,
      required String hint,
      required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name, style: inter14Medium()),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (val) {},
            style: inter14Medium(),
            cursorColor: primaryBlue,
            decoration: generalDecoration(value, false),
            scrollPadding: const EdgeInsets.only(bottom: 52),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget bottomButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: white,
      child: InkWell(
        onTap: () {},
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
              Text("Logout", style: inter16BoldWhite()),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planet_gadget/library/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:planet_gadget/application/auth/login/login_field_notifier.dart';
import 'package:planet_gadget/application/auth/login/login_field_state.dart';
import 'package:planet_gadget/application/auth/login/login_notiifer.dart';
import 'package:planet_gadget/library/loading.dart';
import 'package:planet_gadget/library/textstyle.dart';
import 'package:planet_gadget/utils/constants/path.dart';
import '../../../../library/color.dart';
import '../../account/widgets/field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  FirebaseService service = FirebaseService();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginNotifier);
    final loginStateNotifier = ref.read(loginNotifier.notifier);
    LoginFieldState loginFieldState = ref.watch(loginFieldNotifier);
    final loginFieldStateNotifier = ref.read(loginFieldNotifier.notifier);
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: white,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: RefreshIndicator(
            onRefresh: () {
              return refresh();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('We are very happy to see you again!',
                          textAlign: TextAlign.center, style: inter28Bold()),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Please log in with an existing account',
                          textAlign: TextAlign.center,
                          style: inter16MediumBlack2()),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: <Widget>[
                          field(
                            name: "Email",
                            hint: "Please enter your registered email",
                            controller: emailC,
                            error: loginFieldState.email.errorMessage,
                            onchanged: (val) {
                              loginFieldStateNotifier.checkField(
                                  val: val,
                                  fieldEmpty: loginFieldState.email.isEmpty,
                                  fieldErrorMsg:
                                      loginFieldState.email.errorMessage,
                                  errorMsg: "Email harus diisi",
                                  type: "email");
                            },
                          ),
                          field(
                            isPassword: true,
                            visiblePassword: loginFieldState.visiblePassword,
                            name: "Password",
                            hint: "Please enter your registered email",
                            controller: passwordC,
                            error: loginFieldState.password.errorMessage,
                            onchanged: (val) {
                              loginFieldStateNotifier.checkField(
                                  val: val,
                                  fieldEmpty: loginFieldState.password.isEmpty,
                                  fieldErrorMsg:
                                      loginFieldState.password.errorMessage,
                                  errorMsg: "Password harus diisi",
                                  type: "password");
                            },
                            changeVisiblePassword: () =>
                                loginFieldStateNotifier.changeVisiblePassword(),
                          )
                        ],
                      ),
                    ),
                    // const SizedBox(height: 20),
                    loginState.when(
                      error: (error) => Text(error ?? 'Error'),
                      loading: () => loadingWidget,
                      initial: () => InkWell(
                        onTap: () async {
                          log("EMAILNYA : ${ref.read(loginFieldNotifier).email.value}");
                          log("PASSWORDNYA : ${ref.read(loginFieldNotifier).email.value}");
                          // loginStateNotifier.login();
                          User? user = await service.signInwithGoogle();
                          log("USER EMAIL : ${user!.email}");
                          if (user != null) {}
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: primaryBlue,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset("${iconsPath}google.svg",
                                  width: 20, height: 20),
                              const SizedBox(width: 12),
                              Text("Login with account Google",
                                  style: inter16BoldWhite()),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account ? ",
                            style: inter14MediumBlack2()),
                        Text("Register", style: inter14BoldBlack2()),
                      ],
                    ),
                    // TextFormField(
                    //   // autofocus: true,
                    //   controller: searchC,
                    //   autovalidateMode: AutovalidateMode.onUserInteraction,
                    //   onChanged: (val) => onChangedSearch(val),
                    //   style: inter14Medium(),
                    //   cursorColor: primaryBlue,
                    //   decoration: searchDecoration("Cari produk", onClear: () {
                    //     searchC.clear();
                    //     searchValue = "";
                    //     searchResult.clear();
                    //     setState(() {});
                    //   },
                    //       borderColor: secondaryBlue,
                    //       clearIcon: searchC.text.isNotEmpty),
                    //   scrollPadding: const EdgeInsets.only(bottom: 52),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  refresh() async {}
}

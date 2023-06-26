import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/auth/login/login_repository.dart';
import 'login_field_notifier.dart';
import 'login_field_state.dart';
import 'login_state.dart';

final loginNotifier =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) =>
        LoginNotifier(
            loginRepository: ref.watch(_loginRepository),
            loginFieldState: ref.watch(loginFieldNotifier)));

final _loginRepository = Provider<ILoginRepository>((ref) => LoginRepository());

class LoginNotifier extends StateNotifier<LoginState> {
  final ILoginRepository _iLoginRepository;
  LoginFieldState _loginFieldState;
  LoginNotifier(
      {required ILoginRepository loginRepository,
      required LoginFieldState loginFieldState})
      : _iLoginRepository = loginRepository,
        _loginFieldState = loginFieldState,
        super(const LoginState.initial());

  Future<void> login() async {
    // _loginFieldState = _loginFieldState.copyWith();
    state = const LoginState.loading();
    log("EMAIL : ${_loginFieldState.email.value}");
    log("PASSWORD : ${_loginFieldState.password.value}");
    // state = const LoginState.initial();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_tech/features/login/cubit/login_states.dart';
import 'package:modern_tech/features/login/data/model/login_body_request.dart';
import 'package:modern_tech/features/registertaion/data/model/register_body_response.dart';

import '../../../core/helpers/app_utilities.dart';
import '../data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginStates.initial());

  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();

  RegisterBodyResponse? registerResponse;

  void login() async {
    try {
      emit(const LoginStates.loading());

      if (user.text.isEmpty || password.text.isEmpty) {
        emit(const LoginStates.emptyInput());
        return;
      }

      final response = await _loginRepo
          .register(LoginBodyRequest(user: user.text, password: password.text));
      response.when(success: (response) {
        registerResponse = response;

        AppUtilities().isLogin = true;
        password.clear();
        user.clear();
        AppUtilities().loginData = response;

        emit(LoginStates.successLogin(response));
      }, failure: (error, errorType) {
        emit(LoginStates.error(message: error.toString()));
      });
    } catch (e) {
      emit(
        LoginStates.error(
          message: e.toString(),
        ),
      );
    }
  }
}

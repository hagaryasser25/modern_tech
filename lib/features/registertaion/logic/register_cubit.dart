import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_tech/features/registertaion/data/model/register_body_request.dart';
import 'package:modern_tech/features/registertaion/data/model/register_body_response.dart';
import 'package:modern_tech/features/registertaion/logic/register_states.dart';

import '../../../core/helpers/app_utilities.dart';
import '../data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(const RegisterStates.initial());

  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  RegisterBodyResponse? registerResponse;

  void register() async {
    try {
      emit(const RegisterStates.loading());

      if (email.text.isEmpty ||
          password.text.isEmpty ||
          phoneNumber.text.isEmpty ||
          name.text.isEmpty ||
          confirmPassword.text.isEmpty ||
          password.text != confirmPassword.text) {
        emit(const RegisterStates.emptyInput());
        return;
      }

      final response = await _registerRepo.register(
        RegisterBodyRequest(
            email: email.text,
            password: password.text,
            name: name.text,
            phone: phoneNumber.text,
            confirmPassword: confirmPassword.text),
      );
      response.when(success: (response) {
        registerResponse = response;

        if (response.status == true) {
          AppUtilities().isLogin = true;
          email.clear();
          phoneNumber.clear();
          name.clear();
          password.clear();
          confirmPassword.clear();
          AppUtilities().loginData = response;
        }
        emit(RegisterStates.successRegister(response));
      }, failure: (error, errorType) {
        emit(RegisterStates.error(message: error.toString()));
      });
    } catch (e) {
      emit(
        RegisterStates.error(
          message: e.toString(),
        ),
      );
    }
  }
}

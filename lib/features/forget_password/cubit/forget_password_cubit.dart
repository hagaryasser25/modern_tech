import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modern_tech/features/forget_password/data/model/check_otp_response.dart';
import 'package:modern_tech/features/forget_password/data/model/send_otp_request.dart';
import 'package:modern_tech/features/forget_password/data/model/send_otp_response.dart';
import 'package:modern_tech/features/forget_password/data/repo/forget_password_repo.dart';
import '../data/model/check_otp_request.dart';
import 'forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  final ForgetPasswordRepo _forgetPasswordRepo;
  ForgetPasswordCubit(this._forgetPasswordRepo)
      : super(const ForgetPasswordStates.initial());

  final TextEditingController user = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  SendOtpResponse? sendOtpResponse;
  CheckOtpResponse? checkOtpResponse;

  void sendOtp() async {
    try {
      emit(const ForgetPasswordStates.loading());

      if (user.text.isEmpty) {
        emit(const ForgetPasswordStates.emptyInput());
        return;
      }

      final response =
          await _forgetPasswordRepo.sendOtp(SendOtpRequest(user: user.text));

      response.when(success: (response) {
        sendOtpResponse = response;
        if (sendOtpResponse?.status == false) {
          emit(const ForgetPasswordStates.invalidInput());
        } else {
         // user.clear();

          emit(ForgetPasswordStates.success(response));
        }
      }, failure: (error, errorType) {
        emit(ForgetPasswordStates.error(message: error.toString()));
      });
    } catch (e) {
      emit(
        ForgetPasswordStates.error(
          message: e.toString(),
        ),
      );
    }
  }

  void checkOTP(String resetToken) async {
    try {
      emit(const ForgetPasswordStates.loading());
      final response = await _forgetPasswordRepo.checkOtp(
        CheckOtpRequest(
          otp: int.parse(otpController.text),
          token: resetToken,
        ),
      );
      response.when(success: (response) {
        checkOtpResponse = response;
        if (checkOtpResponse?.status == false) {
          emit(const ForgetPasswordStates.invalidInput());
        } else {
          otpController.clear();
          emit(ForgetPasswordStates.success(response));
        }
      }, failure: (error, type) {
        emit(ForgetPasswordStates.error(message: error.toString()));
      });
    } catch (e) {
      emit(
        ForgetPasswordStates.error(
          message: e.toString(),
        ),
      );
    }
  }

    void resendOtp(String? email) async {
    try {
      emit(const ForgetPasswordStates.loading());

      final response =
          await _forgetPasswordRepo.sendOtp(SendOtpRequest(user: email));

      response.when(success: (response) {
        sendOtpResponse = response;
        if (sendOtpResponse?.status == false) {
          emit(const ForgetPasswordStates.invalidInput());
        } else {
          user.clear();

          emit(ForgetPasswordStates.success(response));
        }
      }, failure: (error, errorType) {
        emit(ForgetPasswordStates.error(message: error.toString()));
      });
    } catch (e) {
      emit(
        ForgetPasswordStates.error(
          message: e.toString(),
        ),
      );
    }
  }

}

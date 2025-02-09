import 'package:freezed_annotation/freezed_annotation.dart';
part 'forget_password_states.freezed.dart';

@Freezed()
class ForgetPasswordStates<T> with _$ForgetPasswordStates<T>{
  const factory ForgetPasswordStates.initial()=_Initial;
  const factory ForgetPasswordStates.loading()=Loading;
  const factory ForgetPasswordStates.loaded()=Loaded;
  const factory ForgetPasswordStates.emptyInput()=EmptyInput;
  const factory ForgetPasswordStates.invalidInput()=InvalidInput;
  const factory ForgetPasswordStates.success(T data)=Success<T>;
  const factory ForgetPasswordStates.error({required String message})=Error;
}
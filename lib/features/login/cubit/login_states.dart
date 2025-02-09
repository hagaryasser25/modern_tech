import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_states.freezed.dart';

@Freezed()
class LoginStates<T> with _$LoginStates<T>{
  const factory LoginStates.initial()=_Initial;
  const factory LoginStates.loading()=Loading;
  const factory LoginStates.loaded()=Loaded;
  const factory LoginStates.emptyInput()=EmptyInput;
  const factory LoginStates.invalidInput()=InvalidInput;
  const factory LoginStates.successLogin(T data)=SuccessLogin<T>;
  const factory LoginStates.error({required String message})=Error;
}
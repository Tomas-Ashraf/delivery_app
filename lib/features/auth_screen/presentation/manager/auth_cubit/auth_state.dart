part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSigninView extends AuthState {}

final class AuthSignupView extends AuthState {}

final class AuthPasswordVisibilityChangedState extends AuthState {}

final class UserSignUpLoading extends AuthState {}

final class UserSignUpSuccess extends AuthState {}

final class UserSignUpFailure extends AuthState {
  final String errorMessage;

  UserSignUpFailure({required this.errorMessage});
}

final class UserSignInLoading extends AuthState {}

final class UserSignInSuccess extends AuthState {}

final class UserSignInFailure extends AuthState {
  final String errorMessage;

  UserSignInFailure({required this.errorMessage});
}

final class PasscodeResetLoading extends AuthState {}

final class PasscodeResetSuccess extends AuthState {}

final class PasscodeResetFailure extends AuthState {
  final String errorMessage;

  PasscodeResetFailure({required this.errorMessage});
}

part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSigninView extends AuthState {}

final class AuthSignupView extends AuthState {}

final class AuthPasswordVisibilityChangedState extends AuthState {}

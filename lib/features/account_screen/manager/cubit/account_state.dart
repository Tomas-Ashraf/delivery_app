part of 'account_cubit.dart';

sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class AccountGetDataLoading extends AccountState {}

final class AccountGetDataSuccess extends AccountState {
  final UserModel userModel;

  AccountGetDataSuccess({required this.userModel});
}

final class AccountGetDataFailure extends AccountState {
  final String errorMessage;

  AccountGetDataFailure({required this.errorMessage});
}

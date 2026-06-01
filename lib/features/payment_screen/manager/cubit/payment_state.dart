part of 'payment_cubit.dart';

sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class AccountGetDataLoading extends PaymentState {}

final class AccountGetDataSuccess extends PaymentState {
  final UserModel userModel;

  AccountGetDataSuccess({required this.userModel});
}

final class AccountGetDataFailure extends PaymentState {
  final String errorMessage;

  AccountGetDataFailure({required this.errorMessage});
}

final class DeliverMethodChanged extends PaymentState {}

final class PaymentMethodChanged extends PaymentState {}

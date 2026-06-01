import 'dart:developer' show log;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/utils/firebase_service.dart';
import 'package:food_delivery_app/features/auth_screen/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  Future<UserModel> getUserData() async {
    emit(AccountGetDataLoading());
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userName = prefs.getString('UserName');
      DocumentSnapshot<Map<String, dynamic>> userData = await FireBaseService
          .firestoreInstance
          .collection('users')
          .doc(userName)
          .get();
      UserModel userModel = UserModel.fromMap(userData.data() ?? {});
      emit(AccountGetDataSuccess(userModel: userModel));
      return userModel;
    } catch (e) {
      emit(AccountGetDataFailure(errorMessage: e.toString()));
      rethrow;
    }
  }

  String deliveryMethod = 'Door delivery';
  void changeDeliveryMethod(String method) {
    deliveryMethod = method;
    log('deliveryMethod: $deliveryMethod');
    emit(DeliverMethodChanged());
  }

  String paymentMethod = 'Card';
  void changePaymentMethod(String method) {
    paymentMethod = method;
    log('paymentMethod: $paymentMethod');
    emit(PaymentMethodChanged());
  }
}

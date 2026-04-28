import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/utils/firebase_service.dart';
import 'package:food_delivery_app/features/auth_screen/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());

  Future<void> getUserData() async {
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
    } catch (e) {
      emit(AccountGetDataFailure(errorMessage: e.toString()));
    }
  }
}

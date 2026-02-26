// ignore_for_file: unused_local_variable

import 'dart:developer' show log;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  int currentIndex = 0;
  bool isObscure = true;

  void showSigninView() {
    currentIndex = 0;
    emit(AuthSigninView());
  }

  void showSignupView() {
    currentIndex = 1;
    emit(AuthSignupView());
  }

  void togglePasswordVisibility() {
    isObscure = !isObscure;
    emit(AuthPasswordVisibilityChangedState());
  }

  String? nameValidator({String? value}) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Name';
    }
    return null;
  }

  String? emailValidator({String? value}) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.isEmpty) {
      return 'Please enter your Email';
    }
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    return null; // valid
  }

  String? passwordSignupValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null; // valid
  }

  Future<void> signIn({
    required String email,
    required String password,
    final context,
  }) async {
    emit(UserSignInLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('The user has signed in Successfully');
      emit(UserSignInSuccess());
    } on FirebaseAuthException catch (e) {
      log('Firebase Exception: ${e.toString()}');
      if (e.code == 'user-not-found') {
        emit(UserSignInFailure(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
          UserSignInFailure(
            errorMessage: 'Wrong password provided for that user.',
          ),
        );
      } else if (e.code == 'invalid-credential') {
        emit(
          UserSignInFailure(
            errorMessage: 'Wrong user or password provided for that user.',
          ),
        );
      }
    } catch (e) {
      log(e.toString());
      emit(UserSignInFailure(errorMessage: e.toString()));
    }
  }

  Future<void> signUp({
    String? name,
    required String email,
    required String password,
    final context,
  }) async {
    emit(UserSignUpLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      log('The user added Successfully');
      CollectionReference users = FirebaseFirestore.instance.collection(
        'users',
      );
      users.add({
        'full_name': name,
        'email': email,
        'initail_time': DateTime.now(),
      });
      emit(UserSignUpSuccess());
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      if (e.code == 'weak-password') {
        emit(
          UserSignUpFailure(errorMessage: 'The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          UserSignUpFailure(
            errorMessage: 'The account already exists for that email.',
          ),
        );
      }
    } catch (e) {
      log(e.toString());
      emit(UserSignUpFailure(errorMessage: e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      emit(PasscodeResetLoading());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(PasscodeResetSuccess());
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      switch (e.code) {
        case 'user-not-found':
          return emit(
            PasscodeResetFailure(
              errorMessage: 'No user found with this email.',
            ),
          );
        case 'invalid-email':
          return emit(
            PasscodeResetFailure(
              errorMessage: 'The email address is not valid.',
            ),
          );
        case 'too-many-requests':
          return emit(
            PasscodeResetFailure(
              errorMessage: 'Too many requests. Please try again later.',
            ),
          );

        default:
          return emit(
            PasscodeResetFailure(
              errorMessage: e.message ?? 'Something went wrong.',
            ),
          );
      }
    }
  }
}

abstract class AuthRepo {
  Future<void> signIn();
  Future<void> signUp();
  Future<void> forgetPassword();
}

class UserModel {
  String? userName;
  String email;
  String password;
  String? phoneNumber;
  String? address;

  UserModel({
    this.userName,
    this.email = '',
    this.password = '',
    this.phoneNumber,
    this.address,
  });
}

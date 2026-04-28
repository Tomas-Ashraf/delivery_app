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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['full_name'].toString(),
      email: map['email'].toString(),
      address: map['address'].toString(),
      phoneNumber: map['phone_number'].toString(),
    );
  }
}

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phone;
  String? paymentMethod;
  String? avatarUrl;
  String? address;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.phone,
    this.paymentMethod,
    this.avatarUrl,
    this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'paymentMethod': paymentMethod,
      'avatarUrl': avatarUrl,
      'address': address,
      'createdAt': DateTime.now(),
    };
  }
}

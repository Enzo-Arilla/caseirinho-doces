class UserProfile {

  String? idGoogle;
  String? name;
  String? email;
  String? password;
  String? address;
  String? sex;
  String? profileImageUrl;

  UserProfile({this.idGoogle, required this.name, required this.email, required this.password, required this.address, required this.sex, required this.profileImageUrl });

  factory UserProfile.fromMap(Map map) {
    return UserProfile(
        idGoogle: map["idGoogle"], name: map["name"],
        email: map["email"], password: map['password'], 
        address: map['address'], sex: map['sex'], 
        profileImageUrl: '');
  }

  toMap() {
    return { "idGoogle": idGoogle, "name": name, "email": email, "password": password,
             "address": address, "sex": sex, "profileImageUrl": profileImageUrl };
  }

}

class UserProfileSingleton {
  static final UserProfileSingleton _instance = UserProfileSingleton._internal();

  UserProfile? _user;

  UserProfileSingleton._internal();

  static UserProfileSingleton get instance => _instance;

  UserProfile? get user => _user;

  set user(UserProfile? user) {
    _user = user;
  }
}
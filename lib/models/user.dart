class UserDate {
  String password;
  String email;
  String title;
  String username;
  String profileImg;
  String uid;

  UserDate(
      {required this.password,
      required this.email,
      required this.title,
      required this.username,
      required this.profileImg,
      required this.uid,
      });

  Map<String, dynamic> convert2Map() {
    return {
      "password": password,
      "email": email,
      "title": title,
      "username": username,
      "profileImg": profileImg,
      "uid":uid,
    };
  }
}

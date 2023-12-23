class SigninResponseModel {
  String name;
  String email;
  String token;

  SigninResponseModel({
    required this.name,
    required this.email,
    required this.token,
  });

  factory SigninResponseModel.fromJson(Map<String, dynamic> json) =>
      SigninResponseModel(
        name: json["name"],
        email: json["email"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "token": token,
      };
}

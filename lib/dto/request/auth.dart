class LoginRequest {
  String username;
  String password;

  LoginRequest({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }

  LoginRequest fromJson(Map<String, dynamic> data) {
    return LoginRequest(
      username: data["username"],
      password: data["password"],
    );
  }
}

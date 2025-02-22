// User Model
class User {
  final String email;
  final String username;
  final String firstName;
  final String lastName;
  final String? token;

  User({
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print('Parsing user data: $json');
    return User(
      email: json['email'] as String,
      username: json['username'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      token: json['token'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'token': token,
    };
  }
}

//Login Request Model
class LoginRequest{
  String email;
  String password;

  LoginRequest({required this.email, required this.password});

  // Convert the model to a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toJson() =>{
    'email': email,
    'password': password,
  };

}

//Register Request Model
class RegisterRequest{
  String email;
  String password;
  String username;

  RegisterRequest({required this.email, required this.password, required this.username});

  // Convert the model to a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toJson() =>{
    'email': email,
    'password': password,
    'username': username,
  };
}


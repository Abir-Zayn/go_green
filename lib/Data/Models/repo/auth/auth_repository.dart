// import 'dart:convert';

// import 'package:go_green/Core/Constant/utils/environment.dart';
// import 'package:http/http.dart' as http;

// class AuthRepository {
//   final String baseURL = "${Environment.baseUrl}auth/";

//   Future<String> login(String email, String password) async {
//     try {
//       final response = await http.post(
//         Uri.parse('${baseURL}token/login/'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'email': email,
//           'password': password,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         return data['auth_token'];
//       } else {
//         throw Exception('Failed to login');
//       }
//     } catch (e) {
//       throw Exception('Failed to Connect Server');
//     }
//   }

//   Future<void> logout(String token) async {
//     try {
//       await http.post(
//         Uri.parse('${baseURL}token/logout/'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Token $token',
//         },
//       );
//     } catch (e) {
//       throw Exception('Failed to logout');
//     }
//   }
// }

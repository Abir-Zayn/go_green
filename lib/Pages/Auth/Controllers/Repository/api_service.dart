import 'package:dio/dio.dart';
import 'package:go_green/Core/Constant/utils/environment.dart';
import 'package:go_green/Data/Models/auth/user_model.dart';

class AuthService {
  final Dio _dio = Dio();
  final String baseURL = Environment.baseUrl;

  Future<User> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '$baseURL/auth/jwt/create/',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Success Login
        final token = response.data['access'];

        // Get the user details
        final userResponse = await _dio.get(
          '$baseURL/auth/users/me/',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
        );

        final userData = userResponse.data;
        userData['token'] = token;
        return User.fromJson(userData);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      print(e); // Log the error for debugging
      throw Exception('Failed to Connect Server');
    }
  }

  Future<bool> register({
    required String email,
    required String username,
    required String firstName,
    required String lastName,
    required String password,
    required String rePassword,
  }) async {
    try {
      final response = await _dio.post(
        '$baseURL/auth/users/',
        data: {
          'email': email,
          'username': username,
          'first_name': firstName,
          'last_name': lastName,
          'password': password,
          're_password': rePassword,
        },
        options: Options(
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      // Check if registration was successful
      if (response.statusCode == 201) {
        return true;
      } else {
        if (response.data is Map) {
          final errors = response.data as Map;
          String errorMessage = '';
          errors.forEach((key, value) {
            if (value is List) {
              errorMessage += '$key: ${value.join(", ")}\n';
            } else {
              errorMessage += '$key: $value\n';
            }
          });
          throw Exception(errorMessage.trim());
        }
        throw Exception('Failed to register user');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        // If we get a 500 error but the user was created
        return true;
      }
      if (e.response != null && e.response!.data is Map) {
        final errors = e.response!.data as Map;
        String errorMessage = '';
        errors.forEach((key, value) {
          if (value is List) {
            errorMessage += '$key: ${value.join(", ")}\n';
          } else {
            errorMessage += '$key: $value\n';
          }
        });
        throw Exception(errorMessage.trim());
      }
      throw Exception('Failed to register: ${e.message}');
    }
  }
}

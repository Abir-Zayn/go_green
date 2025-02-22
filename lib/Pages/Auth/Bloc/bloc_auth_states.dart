import 'package:go_green/Data/Models/auth/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  AuthAuthenticated(this.user);
}

class AuthError extends AuthState {
  final String message;
  final bool isRegError;

  AuthError(this.message, {this.isRegError = false});

  // Add this method to format the error message for display
  String get formattedMessage {
    return message
        .replaceAll('Exception: ', '')
        .replaceAll('[', '')
        .replaceAll(']', '');
  }
}

// Add this new state
class AuthRegisteredButLoginFailed extends AuthState {
  final String message;
  final String email;
  final String password;

  AuthRegisteredButLoginFailed(
    this.message, {
    required this.email,
    required this.password,
  });
}

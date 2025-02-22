// Bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_green/Core/Constant/utils/shared_pref.dart';
import 'package:go_green/Pages/Auth/Controllers/Repository/api_service.dart';
import 'package:go_green/Pages/Auth/Bloc/bloc_auth_event.dart';
import 'package:go_green/Pages/Auth/Bloc/bloc_auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService = AuthService();

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
    on<RegisterEvent>(_onRegisterEvent);
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authService.login(event.email, event.password);
      // Save user session
      final prefManager = await SharedPrefManager.getInstance();
      await prefManager.saveUserSession(user);
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRegisterEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // First try to register
      final registered = await _authService.register(
        email: event.email,
        password: event.password,
        username: event.username,
        firstName: event.firstName,
        lastName: event.lastName,
        rePassword: event.repassword,
      );

      if (registered) {
        // If registration successful, wait a bit before trying to login
        await Future.delayed(const Duration(seconds: 1));
        try {
          // Then try to login
          final user = await _authService.login(event.email, event.password);
          emit(AuthAuthenticated(user));
        } catch (loginError) {
          // If login fails after successful registration
          emit(AuthRegisteredButLoginFailed(
            'Registration successful! Please try logging in.',
            email: event.email,
            password: event.password,
          ));
        }
      } else {
        emit(AuthError('Registration failed'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}

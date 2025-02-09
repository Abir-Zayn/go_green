import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_green/Data/Models/service/appwrite_service.dart';
import 'package:go_green/Pages/Auth/Bloc/bloc_auth_event.dart';
import 'package:go_green/Pages/Auth/Bloc/bloc_auth_states.dart';

class BlocAuth extends Bloc<BlocAuthEvent, BlocAuthStates> {
  final AppwriteService _appwriteService;

  //initial state
  BlocAuth({required AppwriteService appwriteService})
      : _appwriteService = appwriteService,
        super(AuthInitial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<GoogleSignInEvent>(_onGoogleSignInEvent);
    on<FacebookSignInEvent>(_onFacebookSignInEvent);
    on<SignOutRequested>(_onSignOutRequested);
  }


  //Event handlers [getting the current user if the user is authenticated]
  Future<void> _onCheckAuthStatus(
      CheckAuthStatus event, Emitter<BlocAuthStates> emit) async {
    try {
      final user = await _appwriteService.getCurrentUser();
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(NotAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  //Event handlers [Google Sign in]
  Future<void> _onGoogleSignInEvent(
      GoogleSignInEvent event, Emitter<BlocAuthStates> emit) async {
    try {
      final user = await _appwriteService.signInWithGoogle();
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(NotAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  //Event handlers [Facebook Sign in]
  Future<void> _onFacebookSignInEvent(
      FacebookSignInEvent event, Emitter<BlocAuthStates> emit) async {
    try {
      final user = await _appwriteService.signInWithGoogle();
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(NotAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }



  Future<void> _onSignOutRequested(
      SignOutRequested event, Emitter<BlocAuthStates> emit) async {
    try {
      await _appwriteService.SignOut();
      emit(NotAuthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}

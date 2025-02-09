import 'package:appwrite/models.dart' as Models;

abstract class BlocAuthStates {}

  //Initial state or default state
  class AuthInitial extends BlocAuthStates{}

  // Loading state [a circular progress indicator can be shown when data is being fetched or update from the server/network]
  class AuthLoading extends BlocAuthStates{}

  // Authenticated state [when the user is successfully authenticated]
  class Authenticated extends BlocAuthStates{
    final Models.User user;
    Authenticated(this.user);
  }

  //Not Authenticated state [when the user is not authenticated]
  class NotAuthenticated extends BlocAuthStates{}

  //Error state [when an error occurs during the authentication process]
  //Error state will show the error message whereas the success state
  //will show you the user details
  class AuthError extends BlocAuthStates{
    final String message;
    AuthError(this.message);
  }



abstract class BlocAuthEvent {}
  class  CheckAuthStatus extends BlocAuthEvent{}

  class GoogleSignInEvent extends BlocAuthEvent{}
  
  class FacebookSignInEvent extends BlocAuthEvent{}
  
  class SignOutRequested extends BlocAuthEvent{}


//Bloc divided or provides 3 different scene like
 //auth_event
 //auth_states
 //auth_bloc
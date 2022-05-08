abstract class LoginAppGpStates {}

class LoginAppGpInitailsStates extends LoginAppGpStates{}

class LoginAppStateLoadingState extends LoginAppGpStates{}

class LoginAppStateSuccessState extends LoginAppGpStates{}

class LoginAppStateErrorState extends LoginAppGpStates{
  final String error;

  LoginAppStateErrorState(this.error);

}



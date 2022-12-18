abstract class LoginViewModelStates {}

class LoginInitialState extends LoginViewModelStates {}

class LoginLoadingState extends LoginViewModelStates {}

class LoginSuccessState extends LoginViewModelStates {}

class LoginChangePasswordVisibilityState extends LoginViewModelStates {}

class LoginErrorState extends LoginViewModelStates {
  final String error;

  LoginErrorState(this.error);
}

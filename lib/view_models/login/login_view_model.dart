import 'package:core_flutter_package/core_flutter_package.dart' as core;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation_layer/view_models/login/login_view_model_states.dart';

class LoginViewModel extends Cubit<LoginViewModelStates> {
  LoginViewModel() : super(LoginInitialState());

  GlobalKey<FormState>? formKey;
  TextEditingController? usernameController;
  TextEditingController? passwordController;

  void init() {
    formKey = GlobalKey<FormState>();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  bool _isPasswordHidden = true;

  bool get isPasswordHidden => _isPasswordHidden;

  void changePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    emit(LoginChangePasswordVisibilityState());
  }

  Future<void> login() async {
    if (!formKey!.currentState!.validate()) {
      return;
    }
    emit(LoginLoadingState());

    var loginResponse =
        await core.LoginUseCase(userRepository: core.UserRepository()).execute(
      username: usernameController!.text,
      password: passwordController!.text,
    );

    loginResponse.fold(
      (failure) => emit(LoginErrorState(failure.error.toString().tr())),
      (user) async {
        var getStatusResponse = await core.GetStatusUseCase(
          userRepository: core.UserRepository(),
        ).execute(
          userUUID: user.uuid,
          accessToken: user.accessToken,
        );
        FirebaseMessaging messaging = FirebaseMessaging.instance;
        await PushNotificationService().initialize(messaging);

        getStatusResponse.fold(
          (failure) => emit(LoginErrorState(failure.error.toString().tr())),
          (status) {
            if (status == (core.UserStatus.INACTIVE.toShortString())) {
              emit(LoginErrorState(AppStrings.userIsInactive.tr()));
            } else {
              core.locator<core.UserService>().saveUser(user: user);
              emit(LoginSuccessState());
            }
          },
        );
      },
    );
  }

  void dispose() {
    close().then(
      (value) {
        usernameController!.clear();
        passwordController!.clear();
        usernameController!.dispose();
        passwordController!.dispose();
        formKey = null;
      },
    );
  }
}

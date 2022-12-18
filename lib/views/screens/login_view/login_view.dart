import 'package:flutter/material.dart';
import 'package:presentation_layer/view_models/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = di.serviceLocator<LoginViewModel>();
    _viewModel.init();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _viewModel,
      child: BlocConsumer<LoginViewModel, LoginViewModelStates>(
        listener: (context, state) async {
          if (state is LoginErrorState) {
            AppConstants.showToast(
              context: context,
              message: state.error.tr(),
            );
          }

          if (state is LoginSuccessState) {
            AppConstants.navigateAndReplace(context, Routes.homeRoute);
          }
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async => OnWillPopDialog(
              context: context,
            ).onWillPop(),
            child: Scaffold(
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            ImageAssetsManager.logoRectangular,
                          ),
                        ),
                        AppConstants.vSize(AppSize.s45),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p30),
                          child: Column(
                            children: [
                              Form(
                                key: _viewModel.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Column(
                                  children: <Widget>[
                                    DefaultFormField(
                                      context: context,
                                      controller:
                                          _viewModel.usernameController!,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      onValidate: MultiValidator(
                                        [
                                          RequiredValidator(
                                            errorText: AppStrings
                                                .usernameRequired
                                                .tr(),
                                          ),
                                        ],
                                      ),
                                      labelText: AppStrings.username.tr(),
                                      prefixIcon: Icons.person,
                                    ),
                                    AppConstants.vSize(AppSize.s20),
                                    DefaultFormField(
                                      context: context,
                                      controller:
                                          _viewModel.passwordController!,
                                      isSecure: _viewModel.isPasswordHidden,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                      onValidate: MultiValidator([
                                        RequiredValidator(
                                          errorText:
                                              AppStrings.passwordError.tr(),
                                        ),
                                      ]),
                                      labelText: AppStrings.password.tr(),
                                      prefixIcon: Icons.lock,
                                      suffixIcon: _viewModel.isPasswordHidden
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      suffixPressed: () {
                                        _viewModel.changePasswordVisibility();
                                      },
                                    ),
                                    AppConstants.vSize(AppSize.s45),
                                    ConditionalBuilder(
                                      condition: state is! LoginLoadingState,
                                      builder: (context) {
                                        return DefaultButton(
                                          text: AppStrings.login.tr(),
                                          function: _viewModel.login,
                                        );
                                      },
                                      fallback: (context) {
                                        return AppConstants
                                            .showLoadingIndicator();
                                      },
                                    ),
                                    AppConstants.vSize(AppSize.s16),
                                    DefaultTextButton(
                                      onPress: () {
                                        AppConstants.navigateTo(context,
                                            Routes.forgotPasswordRoute);
                                      },
                                      text: AppStrings.forgetPassword.tr(),
                                      textStyle: regularTextStyle(
                                        fontSize: FontSize.sp15,
                                        color: ColorsManager.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

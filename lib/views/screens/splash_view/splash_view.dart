import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesman_mobile/app/dependency_injection.dart' as di;
import 'package:salesman_mobile/core/utils/assets_manager.dart';
import 'package:salesman_mobile/view_models/splash/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashViewModel _viewModel;

  @override
  void initState() {
    _viewModel = di.serviceLocator<SplashViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.startDelay(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          ImageAssetsManager.logoCircular,
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
      ),
    );
  }
}

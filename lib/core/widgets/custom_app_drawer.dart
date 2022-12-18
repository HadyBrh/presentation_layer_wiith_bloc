import 'package:core_flutter_package/core_flutter_package.dart' as core;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salesman_mobile/config/helpers/string_helper.dart';
import 'package:salesman_mobile/config/routes/app_routes.dart';
import 'package:salesman_mobile/core/utils/colors_manager.dart';
import 'package:salesman_mobile/core/utils/constants_manager.dart';
import 'package:salesman_mobile/core/utils/font_manager.dart';
import 'package:salesman_mobile/core/utils/strings_manager.dart';
import 'package:salesman_mobile/core/utils/text_styles_manager.dart';
import 'package:salesman_mobile/core/utils/values_manager.dart';
import 'package:salesman_mobile/view_models/home/home_view_model.dart';
import 'package:salesman_mobile/views/widgets/circular_network_image.dart';

class CustomAppDrawer extends StatefulWidget {
  // final String appVersion;
  final HomeViewModel viewModel;
  final core.User user;

  const CustomAppDrawer({
    Key? key,
    // required this.appVersion,
    required this.viewModel,
    required this.user,
  }) : super(key: key);

  @override
  State<CustomAppDrawer> createState() => _CustomAppDrawerState();
}

class _CustomAppDrawerState extends State<CustomAppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildDrawerHeader(),
          AppConstants.vSize(AppSize.s8),
          _createDrawerItem(
            icon: Icons.account_circle,
            text: AppStrings.profile.tr(),
            onTap: () {
              AppConstants.pop(context);
              AppConstants.navigateTo(context, Routes.profileRoute);
            },
          ),
          _createDrawerItem(
            icon: Icons.location_on,
            text: AppStrings.map.tr(),
            onTap: () {
              AppConstants.pop(context);
              AppConstants.navigateTo(context, Routes.googleMapsRoute);
            },
          ),
          _createDrawerItem(
            icon: Icons.language,
            text: AppStrings.languages.tr(),
            onTap: () {
              AppConstants.pop(context);
              // AppConstants.navigateTo(context, Routes.changeLanguageRoute);
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.changeLanguageRoute, (route) => true);
            },
          ),
          _createDrawerItem(
            icon: Icons.notifications_active_outlined,
            text: AppStrings.notifications.tr(),
            onTap: (){
              AppConstants.pop(context);
              AppConstants.navigateTo(context, Routes.pushNotificationRoute);
            },
          ),
          _createDrawerItem(
              icon: Icons.info,
              text: AppStrings.aboutUs.tr(),
              onTap: () {
                AppConstants.pop(context);
                AppConstants.navigateTo(context, Routes.aboutUsRoute);
              }),
          const Divider(height: AppSize.s2),
          _createDrawerItem(
            icon: Icons.logout,
            text: AppStrings.logout.tr(),
            onTap: () {
              AppConstants.pop(context);
              widget.viewModel.logout();
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.viewModel.appVersion,
                      style: semiBoldTextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: FontSize.sp16,
                      ),
                    ),
                    if (core
                            .locator<core.UserService>()
                            .user!
                            .userData!
                            .account !=
                        null)
                      Column(
                        children: [
                          AppConstants.vSize(AppSize.s8),
                          Text(
                            "${AppStrings.poweredBy.tr()} ${context.locale == AppConstants.englishLocale ? core.locator<core.UserService>().user!.userData!.account!.nameEN : core.locator<core.UserService>().user!.userData!.account!.nameAR ?? core.locator<core.UserService>().user!.userData!.account!.nameEN}",
                            style: mediumTextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: FontSize.sp14,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    String userName = StringHelper.concatAndCapitalise(
      widget.user.userData!.firstName,
      widget.user.userData!.lastName,
    );
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsManager.primary,
            ColorsManager.primaryOpacity70,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularNetworkImage(
              imageUrl: widget.user.userData!.profilePicture,
              size: AppSize.s60,
              iconColor: ColorsManager.white,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: AppPadding.p4),
              child: Text(
                userName,
                style: semiBoldTextStyle(color: ColorsManager.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required Function()? onTap,
    // BuildContext context,
  }) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: ColorsManager.primary,
            size: AppSize.s35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
            child: Text(
              text,
              style: mediumTextStyle(
                color: ColorsManager.primary,
                fontSize: FontSize.sp16,
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}

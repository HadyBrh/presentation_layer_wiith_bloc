// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final BuildContext context;
//   final String title;
//   final bool showBackButton;
//   final Widget? widget;
//   final bool showActions;
//   final bool openCartPageAsFullPage;
//   final bool openWishListPageAsFullPage;
//   final VoidCallback? onBackPressed;
//   final bool automaticallyImplyLeading;
//   final bool showSearchBar;
//   final bool refreshParentViewModelOnBack;
//   final bool showCart;
//   final bool showWishList;
//   final double? titleFontSize;
//   var parentViewModel;
//
//   CustomAppBar({
//     required this.context,
//     required this.title,
//     this.showBackButton = true,
//     this.widget,
//     this.showActions = true,
//     this.openCartPageAsFullPage = false,
//     this.openWishListPageAsFullPage = false,
//     this.onBackPressed,
//     this.automaticallyImplyLeading = true,
//     this.showSearchBar = false,
//     this.parentViewModel,
//     this.refreshParentViewModelOnBack = false,
//     this.showCart = true,
//     this.showWishList = true,
//     this.titleFontSize,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: Size.fromHeight(50),
//       child:
//           AppBar(
//           automaticallyImplyLeading: automaticallyImplyLeading,
//           title: Text(
//             title,
//             style:
//                 TextStyle(fontSize: titleFontSize == null ? 16 : titleFontSize),
//           ),
//           leading: showBackButton
//               ? IconButton(
//                   icon: new Icon(
//                     Icons.arrow_back,
//                   ),
//                   onPressed: () {
//                     if (widget != null) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => widget!,
//                         ),
//                       );
//                     } else {
//                       Navigator.pop(context);
//                     }
//                   },
//                 )
//               : null,
//           actions: !showActions
//               ? null
//               : <Widget>[
//                   Visibility(
//                     visible: showSearchBar,
//                     child: InkWell(
//                       onTap: () {
//                         showSearch(
//                           context: context,
//                           delegate: SearchProductView(
//                             parentViewModel: parentViewModel,
//                             refreshParentViewModelOnBack:
//                                 refreshParentViewModelOnBack,
//                           ),
//                         ).then((value) async {
//                           if (refreshParentViewModelOnBack != null &&
//                               refreshParentViewModelOnBack) {
//                             await parentViewModel.initialise();
//                           }
//                         });
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.all(5.0),
//                         child: Icon(
//                           Icons.search,
//                           size: 30,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//         ),
//       );
//   }
//
//   @override
//   Size get preferredSize {
//     return new Size.fromHeight(kToolbarHeight);
//   }
// }

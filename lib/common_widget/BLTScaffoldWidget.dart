import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BLTScaffoldConfig {
  static const double topBarHeight = 44.0;
}

class BltScaffold extends StatelessWidget {
  const BltScaffold({
    super.key,
    required this.title,
    required this.child,
    this.floatingActionButton,
    this.onBack,
    this.bottomNavigationBar,
    this.appBarHeight = BLTScaffoldConfig.topBarHeight,
    this.actions,
    this.appBarBackgroundColor = Colors.white,
    this.appBarBackButtonColor = Colors.black,
    this.appBarTitleColor = Colors.black,
    this.autoSafeArea = true,
  });

  final String title;
  final Widget child;
  final Widget? floatingActionButton;
  final VoidCallback? onBack;
  final Widget? bottomNavigationBar;
  final double appBarHeight;
  final List<Widget>? actions;
  final Color appBarBackgroundColor;
  final Color appBarBackButtonColor;
  final Color appBarTitleColor;
  /// 是不是在safeArea内
  final bool autoSafeArea;

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final showBack = parentRoute?.impliesAppBarDismissal ?? false;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          // elevation: 0,
          backgroundColor: appBarBackgroundColor,
          //设置滚动时的颜色
          surfaceTintColor: appBarBackgroundColor,
          centerTitle: true,
          actions: actions,
          leading: !showBack
              ? null
              : IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: appBarBackButtonColor,
                    size: 20,
                  ),
                  onPressed: () {
                    var mOnBack = onBack;
                    if (mOnBack != null) {
                      mOnBack.call();
                    } else {
                      Get.back();
                    }
                  },
                ),
          title: Text(title, style: TextStyle(color: appBarTitleColor, fontWeight: FontWeight.w700, fontSize: 17)),
        ),
      ),
      body: autoSafeArea ? SafeArea(
        child: child,
      ) : child,
      backgroundColor: Colors.white,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/screen/layout_main/left_bar/side_navigation_bar.dart';
import 'package:beonchat_admin/screen/layout_main/top_bar/topBar.dart';
import 'package:beonchat_admin/widget/responsive/my_responsive.dart';
import 'package:beonchat_admin/widget/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Layout extends StatelessWidget {
  const Layout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (_, theme, __) {
        return MyResponsive(builder: (BuildContext context2, _, screenMT) {
          return Scaffold(
            appBar: screenMT.isMobile
                ? AppBar(
                    elevation: 0,
                    actions: [
                      MainAppBarActions(
                        mobile: screenMT.isMobile,
                      ),
                    ],
                  )
                : null,
            body: screenMT.isMobile
                ? SingleChildScrollView(
                    child: child,
                  )
                : Row(
                    children: [
                      SideNavigationBar(
                        mobile: screenMT.isMobile,
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              left: 0,
                              bottom: 0,
                              child: SingleChildScrollView(
                                padding:
                                EdgeInsets.fromLTRB(0, 58 + flexSpacing, 0, flexSpacing),
                                child: child,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: MainTopBar(
                                mobile: screenMT.isMobile,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            drawer: screenMT.isMobile
                ? SideNavigationBar(
                    mobile: screenMT.isMobile,
                  )
                : null,
          );
        });
      },
    );
  }
}

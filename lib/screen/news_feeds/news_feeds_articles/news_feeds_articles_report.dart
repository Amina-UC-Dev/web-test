import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/provider/dashboard/dashboard_provider.dart';
import 'package:beonchat_admin/provider/main/main_provider.dart';
import 'package:beonchat_admin/screen/layout_main/main_layout/layout.dart';
import 'package:beonchat_admin/screen/news_feeds/news_feeds_articles/widget/news_feeds_articles_widgets.dart';
import 'package:beonchat_admin/widget/responsive/responsive.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsFeedsArticles extends StatelessWidget {
  const NewsFeedsArticles({Key? key, required this.type}) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(builder: (_, dashPro, __) {
      return Consumer<AppThemeProvider>(builder: (_, themePro, __) {
        return WillPopScope(
          onWillPop: () async {
            Provider.of<MainProvider>(context, listen: false)
                .backNavigationHandle(context);
            return false;
          },
          child: Layout(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: MySpacing.x(flexSpacing),
                  child: Text(
                    "News Feeds",
                    style: Styles().text(
                      textType: MyTextType.titleMedium,
                      color: Colours().appBarOnBgColor(themePro.darkTheme),
                      fontW: FontWeight.w600,
                      size: 18,
                    ),
                  ),
                ),

                // FILTER
                MySpacing.height(flexSpacing),
                Padding(
                  padding: MySpacing.x(flexSpacing),
                  child: NewsFeedsArticlesListWidget(
                    dark: themePro.darkTheme,
                    type: type,
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}

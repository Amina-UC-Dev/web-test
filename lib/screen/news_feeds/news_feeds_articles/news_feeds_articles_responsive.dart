import 'dart:async';
import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/provider/news_feeds/news_feeds_articles_provider.dart';
import 'package:beonchat_admin/screen/news_feeds/news_feeds_articles/news_feeds_articles_report.dart';
import 'package:beonchat_admin/widget/responsive/my_responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsFeedsArticlesResponsive extends StatefulWidget {
  const NewsFeedsArticlesResponsive({Key? key}) : super(key: key);

  static String routeName = "/newsfeeds-articles";

  @override
  State<NewsFeedsArticlesResponsive> createState() => _NewsFeedsArticlesResponsiveState();
}

class _NewsFeedsArticlesResponsiveState extends State<NewsFeedsArticlesResponsive> {

  void initState() {
    call();
    super.initState();
  }

  call() async {
    Timer(const Duration(seconds: 2), () {
      bool darkStatus = Provider.of<AppThemeProvider>(context, listen: false).darkTheme;
      Provider.of<NewsFeedsArticlesProvider>(context, listen: false).gettingList(darkStatus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyResponsive(builder: (BuildContext context2, _, screenMT) {
      return NewsFeedsArticles(
        type: screenMT.isMobile
            ? 1
            : screenMT.isTablet
                ? 2
                : 3,
      );
    });
  }
}

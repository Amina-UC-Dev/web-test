import 'dart:async';
import 'dart:html';

import 'package:beonchat_admin/model/navigation_bar/navigation_bar_model.dart';
import 'package:beonchat_admin/screen/dashboard/dashboard_responsive.dart';
import 'package:beonchat_admin/screen/news_feeds/news_feeds_articles/news_feeds_articles_responsive.dart';
import 'package:beonchat_admin/screen/reports/user_registration_report/user_registration_report_responsive.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  bool minimizeDrawer = false;
  ScrollController scrollController = ScrollController();
  List<NavigationBarModel> navigation = [
    NavigationBarModel(
      title: "navigations",
      items: [
        NavBarItem(
          title: "Dashboard",
          icon: Icons.dashboard_rounded,
          multi: false,
          hover: false,
          active: false,
          routName: DashBoardResponsive.routeName,
          subItems: [],
        ),
        NavBarItem(
          title: "Profiles",
          icon: Icons.groups,
          multi: true,
          hover: false,
          active: false,
          routName: "",
          subItems: [
            NavBarItem(
              title: "User",
              icon: Icons.groups,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Company",
              icon: Icons.groups,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Team Member",
              icon: Icons.groups,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "User Registration",
              icon: Icons.groups,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
          ],
        ),
        NavBarItem(
          title: "Bulk Registration",
          icon: Icons.app_registration_outlined,
          multi: true,
          hover: false,
          active: false,
          routName: "",
          subItems: [
            NavBarItem(
              title: "Upload Form",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Upload List Report",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "User Activation Report",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Company Credentials",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
          ],
        ),
        NavBarItem(
          title: "Chats & Conversations",
          icon: Icons.wechat_sharp,
          multi: true,
          hover: false,
          active: false,
          routName: "",
          subItems: [
            NavBarItem(
              title: "Conversations",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Support Message",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Bulk Notification",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Bulk Alert",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
          ],
        ),
        NavBarItem(
          title: "Campaigns",
          icon: Icons.campaign_rounded,
          multi: true,
          hover: false,
          active: false,
          routName: "",
          subItems: [
            NavBarItem(
              title: "Campaign Master",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Campaign Report",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Campaign Company Profile Report",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Company Referral Report",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Affiliate Master",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
          ],
        ),
        NavBarItem(
          title: "News Feeds",
          icon: Icons.feed_rounded,
          multi: true,
          hover: false,
          active: false,
          routName: "",
          subItems: [
            NavBarItem(
              title: "Articles",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: NewsFeedsArticlesResponsive.routeName,
              subItems: [],
            ),
            NavBarItem(
              title: "Promotions",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Schools",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Pending Alerts",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Article Log",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "School Account List",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Manage Ads",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Manage Categories",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
          ],
        ),
      ],
    ),
    NavigationBarModel(
      title: "reports",
      items: [
        NavBarItem(
          title: "Registration Report",
          icon: Icons.text_snippet_rounded,
          multi: false,
          hover: false,
          active: false,
          routName: UserRegistrationReportResponsive.routeName,
          subItems: [],
        ),
        NavBarItem(
          title: "Team Company reg. Report",
          icon: Icons.perm_contact_cal_sharp,
          multi: false,
          hover: false,
          active: false,
          routName: "",
          subItems: [],
        ),
        NavBarItem(
          title: "Team User reg. Report",
          icon: Icons.supervised_user_circle_rounded,
          multi: false,
          hover: false,
          active: false,
          routName: "",
          subItems: [],
        ),
        NavBarItem(
          title: "Group Info Report",
          icon: Icons.my_library_books,
          multi: false,
          hover: false,
          active: false,
          routName: "",
          subItems: [],
        ),
        NavBarItem(
          title: "Deactivate Users",
          icon: Icons.disabled_by_default,
          multi: false,
          hover: false,
          active: false,
          routName: "",
          subItems: [],
        ),
        NavBarItem(
          title: "Referral Report",
          icon: Icons.save_rounded,
          multi: false,
          hover: false,
          active: false,
          routName: "",
          subItems: [],
        ),
        NavBarItem(
          title: "Pending Suburb",
          icon: Icons.edit_location_alt_sharp,
          multi: false,
          hover: false,
          active: false,
          routName: "",
          subItems: [],
        ),
        NavBarItem(
          title: "Pending Campaign",
          icon: Icons.pending_actions,
          multi: false,
          hover: false,
          active: false,
          routName: "",
          subItems: [],
        ),
      ],
    ),
    NavigationBarModel(
      title: "utilities",
      items: [
        NavBarItem(
          title: "Services",
          icon: Icons.settings_applications,
          multi: true,
          hover: false,
          active: false,
          routName: "",
          subItems: [
            NavBarItem(
              title: "Category Management",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Pending Business Type",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Master Block List",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Search Premium Company Logo",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
          ],
        ),
        NavBarItem(
          title: "Settings",
          icon: Icons.miscellaneous_services,
          multi: true,
          hover: false,
          active: false,
          routName: "",
          subItems: [
            NavBarItem(
              title: "Team Members",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Country Info",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Quick Links",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
            NavBarItem(
              title: "Menu Setting",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              routName: "",
              subItems: [],
            ),
          ],
        ),
      ],
    ),
  ];

  init(BuildContext context) {
    navigation.first.items.first.active = true;
    Navigator.pushNamedAndRemoveUntil(
        context, navigation.first.items.first.routName, (route) => false);
    minimizeDrawer = false;
    notifyListeners();
  }

  updateDrawer() {
    minimizeDrawer = !minimizeDrawer;
    notifyListeners();
  }

  updateNavigation(
      {required int mainIndex,
      required int itemIndex,
      int? subItemIndex,
      required BuildContext context}) {
    for (var element in navigation) {
      for (var element2 in element.items) {
        if (element2.active) {
          element2.active = false;
        }
        for (var element3 in element2.subItems) {
          if (element3.active) {
            element3.active = false;
          }
        }
      }
    }
    // for (int i = 0; i < navigation.length; i++) {
    //   for (int j = 0; j < navigation[i].items.length; j++) {
    //     if (i == mainIndex && j == itemIndex && subItemIndex == null) {
    //       navigation[i].items[j].active = true;
    //     } else {
    //       navigation[i].items[j].active = false;
    //     }
    //     for (int k = 0; k < navigation[i].items[j].subItems.length; k++) {
    //       if (i == mainIndex && j == itemIndex && k == subItemIndex){
    //         navigation[i].items[j].active = true;
    //         navigation[i].items[j].subItems[k].active = true;
    //       }else {
    //         navigation[i].items[j].subItems[k].active = false;
    //       }
    //     }
    //   }
    // }
    if (navigation[mainIndex].items[itemIndex].multi) {
      if (subItemIndex != null) {
        navigation[mainIndex].items[itemIndex].active = true;
        navigation[mainIndex].items[itemIndex].subItems[subItemIndex].active =
            true;
        navigateRoute(
            context: context,
            route: navigation[mainIndex]
                .items[itemIndex]
                .subItems[subItemIndex]
                .routName);
      } else {
        navigation[mainIndex].items[itemIndex].active = true;
        navigateRoute(
            context: context,
            route: navigation[mainIndex].items[itemIndex].routName);
      }
    } else {
      navigation[mainIndex].items[itemIndex].active = true;
      navigateRoute(
          context: context,
          route: navigation[mainIndex].items[itemIndex].routName);
    }
    notifyListeners();
  }

  updateHover(int i, int j, bool val) {
    navigation[i].items[j].hover = val;
    notifyListeners();
  }

  backNavigationHandle(BuildContext context) {
    print(ModalRoute.of(context)!.settings.name);
    // Navigator.pop(context);
    // Timer(Duration(seconds: 1), () {
    //   print(ModalRoute.of(context)!.settings.name);
    // });
  }

  navigateRoute({required String route, required BuildContext context}) {
    if (route.isNotEmpty && ModalRoute.of(context)!.settings.name != route) {
      Navigator.pushNamed(context, route);
    }
  }

  updateExpandedHover(int i, int j, int k, bool val) {
    navigation[i].items[j].subItems[k].hover = val;
    notifyListeners();
  }
}

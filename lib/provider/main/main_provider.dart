import 'package:beonchat_admin/model/navigation_bar/navigation_bar_model.dart';
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
          subItems: [],
        ),
        NavBarItem(
          title: "Profiles",
          icon: Icons.groups,
          multi: true,
          hover: false,
          active: false,
          subItems: [
            NavBarItem(
              title: "User",
              icon: Icons.groups,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Company",
              icon: Icons.groups,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Team Member",
              icon: Icons.groups,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "User Registration",
              icon: Icons.groups,
              multi: false,
              hover: false,
              active: false,
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
          subItems: [
            NavBarItem(
              title: "Upload Form",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Upload List Report",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "User Activation Report",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Company Credentials",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
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
          subItems: [
            NavBarItem(
              title: "Conversations",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Support Message",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Bulk Notification",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Bulk Alert",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
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
          subItems: [
            NavBarItem(
              title: "Campaign Master",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Campaign Report",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Campaign Company Profile Report",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Company Referral Report",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Affiliate Master",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
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
          subItems: [
            NavBarItem(
              title: "Articles",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Promotions",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Schools",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Pending Alerts",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Article Log",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "School Account List",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Manage Ads",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Manage Categories",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
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
          subItems: [],
        ),
        NavBarItem(
          title: "Team Company reg. Report",
          icon: Icons.perm_contact_cal_sharp,
          multi: false,
          hover: false,
          active: false,
          subItems: [],
        ),
        NavBarItem(
          title: "Team User reg. Report",
          icon: Icons.supervised_user_circle_rounded,
          multi: false,
          hover: false,
          active: false,
          subItems: [],
        ),
        NavBarItem(
          title: "Group Info Report",
          icon: Icons.my_library_books,
          multi: false,
          hover: false,
          active: false,
          subItems: [],
        ),
        NavBarItem(
          title: "Deactivate Users",
          icon: Icons.disabled_by_default,
          multi: false,
          hover: false,
          active: false,
          subItems: [],
        ),
        NavBarItem(
          title: "Referral Report",
          icon: Icons.save_rounded,
          multi: false,
          hover: false,
          active: false,
          subItems: [],
        ),
        NavBarItem(
          title: "Pending Suburb",
          icon: Icons.edit_location_alt_sharp,
          multi: false,
          hover: false,
          active: false,
          subItems: [],
        ),
        NavBarItem(
          title: "Pending Campaign",
          icon: Icons.pending_actions,
          multi: false,
          hover: false,
          active: false,
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
          subItems: [
            NavBarItem(
              title: "Category Management",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Pending Business Type",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Master Block List",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Search Premium Company Logo",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
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
          subItems: [
            NavBarItem(
              title: "Team Members",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Country Info",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Quick Links",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
            NavBarItem(
              title: "Menu Setting",
              icon: Icons.app_registration_outlined,
              multi: false,
              hover: false,
              active: false,
              subItems: [],
            ),
          ],
        ),
      ],
    ),
  ];

  init() {
    navigation.first.items.first.active = true;
    minimizeDrawer = false;
    notifyListeners();
  }

  updateDrawer() {
    minimizeDrawer = !minimizeDrawer;
    notifyListeners();
  }

  updateNavigation(int i, int j, int? k) {
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
    if (navigation[i].items[j].multi) {
      if (k != null) {
        navigation[i].items[j].active = true;
        navigation[i].items[j].subItems[k].active = true;
      } else {
        navigation[i].items[j].active = true;
      }
    } else {
      navigation[i].items[j].active = true;
    }
    notifyListeners();
  }

  updateHover(int i, int j, bool val) {
    navigation[i].items[j].hover = val;
    notifyListeners();
  }

  updateExpandedHover(int i, int j, int k, bool val) {
    navigation[i].items[j].subItems[k].hover = val;
    notifyListeners();
  }
}

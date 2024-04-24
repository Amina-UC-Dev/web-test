import 'dart:async';
import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/model/navigation_bar/navigation_bar_model.dart';
import 'package:beonchat_admin/provider/main/main_provider.dart';
import 'package:beonchat_admin/screen/layout_main/main_layout/left_bar/multi_nav_item.dart';
import 'package:beonchat_admin/widget/util/custom_pop_menu.dart';
import 'package:beonchat_admin/widget/util/my_container.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiNav extends StatefulWidget {
  const MultiNav(
      {super.key,
      required this.hide,
      required this.dark,
      required this.data,
      required this.i,
      required this.j});

  final int i, j;
  final bool hide, dark;
  final NavBarItem data;

  @override
  State<MultiNav> createState() => _MultiNavState();
}

class _MultiNavState extends State<MultiNav>
    with SingleTickerProviderStateMixin {
  late Animation<double> _iconTurns;
  late AnimationController _controller;
  bool popupShowing = true;
  Function? hideFn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _iconTurns = _controller.drive(Tween<double>(begin: 0.0, end: 0.5)
        .chain(CurveTween(curve: Curves.easeIn)));
    LeftbarObserver.attachListener(widget.data.title, onChangeMenuActive);
  }

  void onChangeMenuActive(String key) {
    if (key != widget.data.title) {
      // onChangeExpansion(widget.data.active);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // var route = UrlService.getCurrentUrl();
    // isActive = widget.children.any((element) => element.route == route);
    onChangeExpansion(widget.data.active);
    if (hideFn != null) {
      hideFn!();
    }
    // popupShowing = false;
  }

  void onChangeExpansion(value) {
    Timer(const Duration(milliseconds: 30), () {
      var pro = Provider.of<MainProvider>(context, listen: false);
      pro.navigation[widget.i].items[widget.j].active = value;
      pro.notifyListeners();
      if (pro.navigation[widget.i].items[widget.j].active) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.hide) {
      return Consumer<MainProvider>(builder: (_, mainPro, __) {
        return CustomPopupMenu(
          backdrop: true,
          show: popupShowing,
          hideFn: (_) => hideFn = _,
          onChange: (_) {
            // popupShowing = _;
          },
          placement: CustomPopupMenuPlacement.right,
          menu: MouseRegion(
            cursor: SystemMouseCursors.click,
            onHover: (event) {
              mainPro.updateHover(widget.i, widget.j, true);
            },
            onExit: (event) {
              mainPro.updateHover(widget.i, widget.j, false);
            },
            child: MyContainer.transparent(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              color: widget.data.active || widget.data.hover
                  ? Colours().activeCardColor(widget.dark)
                  : Colours().trans,
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Icon(
                  widget.data.icon,
                  color: (widget.data.active || widget.data.hover)
                      ? Colours().activeItemColor(widget.dark)
                      : Colours().appBarOnBgColor(widget.dark),
                  size: 20,
                ),
              ),
            ),
          ),
          menuBuilder: (_) => MyContainer.bordered(
            paddingAll: 8,
            width: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: widget.data.subItems.map((item) {
                return MultiNavItem(
                  dark: widget.dark,
                  data: item,
                  hide: widget.hide,
                  i: widget.i,
                  j: widget.j,
                  k: widget.data.subItems.indexOf(item),
                );
              }).toList(),
            ),
          ),
        );
      });
    } else {
      return Consumer<MainProvider>(builder: (_, mainPro, __) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (event) {
            mainPro.updateHover(widget.i, widget.j, true);
          },
          onExit: (event) {
            mainPro.updateHover(widget.i, widget.j, false);
          },
          child: MyContainer.transparent(
            margin: const EdgeInsets.fromLTRB(24, 0, 16, 0),
            color: Colours().trans,
            padding: const EdgeInsets.all(0),
            child: ListTileTheme(
              contentPadding: const EdgeInsets.all(0),
              dense: true,
              horizontalTitleGap: 0.0,
              minLeadingWidth: 0,
              child: ExpansionTile(
                tilePadding: const EdgeInsets.all(0),
                initiallyExpanded: false,
                maintainState: true,
                onExpansionChanged: (_) {
                  LeftbarObserver.notifyAll(widget.data.title);
                  onChangeExpansion(_);
                },
                trailing: RotationTransition(
                  turns: _iconTurns,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                    color: Colours().appBarOnBgColor(widget.dark),
                  ),
                ),
                iconColor: Colours().activeItemColor(widget.dark),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 12),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      widget.data.icon,
                      size: 20,
                      color: widget.data.active || widget.data.hover
                          ? Colours().activeItemColor(widget.dark)
                          : Colours().appBarOnBgColor(widget.dark),
                    ),
                    MySpacing.width(16),
                    Expanded(
                      child: Text(
                        widget.data.title,
                        style: Styles().text(
                            textType: MyTextType.labelLarge,
                            fontW: FontWeight.w400,
                            color: widget.data.active || widget.data.hover
                                ? Colours().activeItemColor(widget.dark)
                                : Colours().appBarOnBgColor(widget.dark),
                            space: 0),
                      ),
                    ),
                  ],
                ),
                collapsedBackgroundColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                backgroundColor: Colors.transparent,
                children: widget.data.subItems.map((item) {
                  return MultiNavItem(
                    dark: widget.dark,
                    data: item,
                    hide: widget.hide,
                    i: widget.i,
                    j: widget.j,
                    k: widget.data.subItems.indexOf(item),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      });
    }
  }
}

typedef LeftbarMenuFunction = void Function(String key);

class LeftbarObserver {
  static Map<String, LeftbarMenuFunction> observers = {};

  static attachListener(String key, LeftbarMenuFunction fn) {
    observers[key] = fn;
  }

  static detachListener(String key) {
    observers.remove(key);
  }

  static notifyAll(String key) {
    for (var fn in observers.values) {
      fn(key);
    }
  }
}

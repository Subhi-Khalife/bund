import 'package:bund/core/constant/images/svg_images.dart';
import 'package:bund/core/widgets/show_svg.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/color/colors_app.dart';
import '../../../../core/config/font_size/font_size.dart';
import '../../../../core/config/text_style/text_style.dart';

enum AppBarLeadingWidget { backIcon, drawer, search }

enum TitleType { text, widget }

enum ActionType { normal, search }

class _AppBarActionType extends StatelessWidget {
  final bool isClicked;
  final Function? actionWhenClickRemoveButton;
  final Function? actionWhenClickSearchButton;
  final Function(String text)? actionOnChangeSearchText;
  final Function(String text)? whenClickSubmmitedButton;
  const _AppBarActionType({
    required this.isClicked,
    required this.whenClickSubmmitedButton,
    this.actionWhenClickRemoveButton,
    this.actionWhenClickSearchButton,
    this.actionOnChangeSearchText,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // isClicked.value = true;
        if (actionWhenClickSearchButton != null) actionWhenClickSearchButton!();
      },
      icon: const ShowSvg(SvgImages.notification),
      color: Colors.white,
    );
  }
}

class _AppBarLeadingWidget extends StatelessWidget {
  final AppBarLeadingWidget? appBarLeadingWidget;

  const _AppBarLeadingWidget({this.appBarLeadingWidget});

  @override
  Widget build(BuildContext context) {
    return appBarLeadingWidget == null || appBarLeadingWidget == AppBarLeadingWidget.search
        ? Container()
        : appBarLeadingWidget == AppBarLeadingWidget.backIcon
            ? IconButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.of(context).pop(false);
                  }
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorsApp.mainColorsApp.primary.shade200,
                ),
              )
            : IconButton(
                onPressed: () {},
                color: ColorsApp.mainColorsApp.natural.shade300,
                icon: const ShowSvg(SvgImages.notification),
              );
  }
}

// ignore: must_be_immutable
class BundAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function? actionWhenClickSearchButton;
  final Function? actionWhenClickRemoveButton;

  final List<Widget>? actions;
  final String? title;
  final bool? centerTitle;
  final Widget? leadingWidget;
  final PreferredSizeWidget? bottomWidget;
  final AppBarLeadingWidget? appBarLeadingWidget;
  final bool automaticallyImplyLeading;
  final TitleType titleType;
  final Widget? titleWidget;
  final Color? bgColor;
  final bool hasBgColor;
  final TextStyle? titleTextStyle;
  final ActionType actionType;
  final bool isSearch;
  final Function(String text)? actionOnChangeSearchText;
  final Function(String text)? whenClickSubmmitedButton;
  const BundAppBar({
    this.whenClickSubmmitedButton,
    this.actionOnChangeSearchText,
    this.isSearch = false,
    this.actionWhenClickSearchButton,
    this.actionWhenClickRemoveButton,
    this.actionType = ActionType.normal,
    this.actions,
    this.titleTextStyle,
    this.bottomWidget,
    this.centerTitle = true,
    this.leadingWidget,
    this.title,
    this.appBarLeadingWidget,
    this.automaticallyImplyLeading = false,
    this.titleType = TitleType.text,
    this.titleWidget,
    Key? key,
    this.bgColor,
    this.hasBgColor = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ValueNotifier<bool> clicked = ValueNotifier<bool>(false);
    assert(() {
      if (titleType == TitleType.widget && titleWidget == null) {
        return false;
      }
      return true;
    }(), "you should add title widget when the title type is image");

    return AppBar(
      leading:
          isSearch ? Container() : _AppBarLeadingWidget(appBarLeadingWidget: appBarLeadingWidget),
      actions: actionType == ActionType.normal
          ? actions
          : <Widget>[
              _AppBarActionType(
                whenClickSubmmitedButton: whenClickSubmmitedButton,
                actionOnChangeSearchText: actionOnChangeSearchText,
                isClicked: isSearch,
                actionWhenClickRemoveButton: actionWhenClickRemoveButton,
                actionWhenClickSearchButton: actionWhenClickSearchButton,
              )
            ],
      toolbarHeight: 100,
      title: titleType == TitleType.text && !isSearch
          ? Text(
              title ?? '',
              style: titleTextStyle ??
                  FontTextStyle.regular(
                      fontSize: FontSize.large, color: ColorsApp.mainColorsApp.primary.shade200),
            )
          : titleWidget,
      elevation: 0.0,
      centerTitle: centerTitle,
      backgroundColor: hasBgColor ? bgColor : ColorsApp.mainColorsApp.natural.shade100,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(appBarLeadingWidget != AppBarLeadingWidget.search ? 60 : 100);
}

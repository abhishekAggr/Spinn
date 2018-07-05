import 'package:flutter/material.dart';
import 'package:quizo/themes/Theme.dart' as Themes;

class GradientAppBar extends StatelessWidget {
  final String title;
  final bool isSearchBar;

  GradientAppBar(this.title, this.isSearchBar);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Container(
        padding: new EdgeInsets.only(top: statusBarHeight),
        height: statusBarHeight + Themes.Dimens.statusbarHeight,
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                Themes.CustomColors.appBarGradientStart,
                Themes.CustomColors.appBarGradientEnd
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: new Row(
          children: <Widget>[
            new Padding(
                padding: new EdgeInsets.only(left: 10.0),
                child: new GestureDetector(
                  child: new Icon(
                    Icons.menu,
                    color: Themes.CustomColors.appBarIconColor,
                  ),
                )),
            new Expanded(
              child: new Center(
                child: new Text(
                  title,
                  style: Themes.TextStyles.appBarTitle,
                ),
              ),
            ),
            isSearchBar
                ? new Padding(
                    padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                    child: new Icon(
                      Icons.search,
                      color: Themes.CustomColors.appBarIconColor,
                    ),
                  )
                : new Padding(
                    padding: new EdgeInsets.only(right: 20.0),
                  ),
          ],
        ));
  }
}

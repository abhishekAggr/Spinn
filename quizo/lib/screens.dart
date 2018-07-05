import 'package:flutter/material.dart';

class ZoomScaffold extends StatefulWidget {
  final Widget menuScreen;
  final Screen contentScreen;

  ZoomScaffold({
    this.menuScreen,
    this.contentScreen,
  });

  @override
  _ZoomScaffoldState createState() => _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
         widget.contentScreen.conentBuilder(context),
      ],
    );
  }
}

class Screen {
  final String title;
  final bool isSearchEnable;
  final WidgetBuilder conentBuilder;
  final bool isMenu;
  final String pageName;
  Screen({this.title, this.isSearchEnable, this.conentBuilder, this.isMenu, this.pageName});
}

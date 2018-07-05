import 'package:flutter/material.dart';
import 'package:quizo/screens.dart';
import 'package:quizo/screens/home/home_screen.dart';
import 'package:quizo/screens/menu/main_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var activeScreen = homeScreen;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: new IconButton(
            onPressed: () {
              gotoPage(context);
            },
            icon: new Icon(
              Icons.menu,
              color: Theme.of(context).primaryColor,
            ),
          ),
          title: new Center(
            child: new Text(
              activeScreen.title,
              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22.0, fontWeight: FontWeight.w400),
            ),
          ),
          actions: <Widget>[
            new Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child:
                  new Icon(Icons.search, color: Theme.of(context).primaryColor),
            )
          ],
        ),
        body: new ZoomScaffold(
          menuScreen: new MenuScreen(),
          contentScreen: activeScreen,
        ));
  }

  gotoPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MenuScreen(pageName: activeScreen.pageName)),
    );
  }
}

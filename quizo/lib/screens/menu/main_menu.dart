import 'package:flutter/material.dart';
import 'package:quizo/my_flutter_app_icons.dart';
import 'package:quizo/themes/Theme.dart' as Themes;

class MenuScreen extends StatefulWidget {
  final String pageName;
  MenuScreen({this.pageName});
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        // image:  new DecorationImage(
        //   image: new AssetImage('assets/images/bg/background.png'),
        //   fit: BoxFit.cover,
        // )
      ),
      child: new Stack(
        children: <Widget>[
          new SizedBox(height: 48.0),
          new Padding(
              padding: new EdgeInsets.only(left: 5.0, top: 30.0),
              child: new Material(
                color: Colors.transparent,
                child: new IconButton(
                  icon: new Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )),
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 60.0),
                new SizedBox(
                  height: 80.0,
                  width: 80.0,
                  child: new CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    backgroundImage: new NetworkImage(
                        'https://randomuser.me/api/portraits/men/77.jpg'),
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: new Column(
                    children: <Widget>[
                      new Material(
                        color: Colors.transparent,
                        shadowColor: Colors.black12,
                        child: new Text(
                          'Terra Jimenez',
                          style: Themes.TextStyles.drawerPrimary,
                        ),
                      ),
                      new Material(
                        color: Colors.transparent,
                        shadowColor: Colors.black12,
                        child: new Text(
                          '2,34,567 Coins',
                          style: Themes.TextStyles.drawerSecondary,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          new Transform(
            transform: new Matrix4.translationValues(0.0, 224.0, 0.0),
            child: new ListView(
              children: <Widget>[
                _MenuListItem(
                    title: 'Quizes',
                    isSelected: widget.pageName == 'quiz' ? true : false),
                _MenuListItem(
                    title: 'My Chats',
                    isSelected: widget.pageName == 'chats' ? true : false),
                _MenuListItem(
                    title: 'Leaderboard',
                    isSelected: widget.pageName == 'leader' ? true : false),
                _MenuListItem(
                    title: 'Notifications',
                    isSelected: widget.pageName == 'noti' ? true : false),
                _MenuListItem(
                    title: 'Earn Coins',
                    isSelected: widget.pageName == 'coins' ? true : false),
              ],
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              new Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new GestureDetector(
                      onTap: () {},
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: new Icon(
                              Icons.settings,
                              color: Themes.CustomColors.bottomStyle,
                            ),
                          ),
                          new Material(
                            color: Colors.transparent,
                            shadowColor: Colors.black26,
                            child: new Text(
                              'Settings',
                              style: Themes.TextStyles.bottomStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      width: 3.0,
                      height: 25.0,
                      decoration: new BoxDecoration(
                          gradient: new LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white,
                          const Color(0xFFAAAAAA)
                        ],
                        // begin: Alignment.bottomLeft,
                        // end: Alignment.centerRight
                      )),
                    ),
                    new GestureDetector(
                      onTap: () {},
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: new Icon(
                              MyFlutterApp.logout,
                              color: Themes.CustomColors.bottomStyle,
                            ),
                          ),
                          new Material(
                            color: Colors.transparent,
                            shadowColor: Colors.black26,
                            child: new Text(
                              'Log Out',
                              style: Themes.TextStyles.bottomStyle,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _MenuListItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  _MenuListItem({this.title, this.isSelected});
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        splashColor: Colors.grey,
        onTap: isSelected ? null : () {},
        child: Container(
          width: double.maxFinite,
          child: new Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  isSelected
                      ? new Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: 2.0,
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: new BoxDecoration(
                              gradient: new LinearGradient(
                            colors: [
                              Colors.white,
                              const Color(0xFFEFF4F8),
                              Colors.white,
                            ],
                          )),
                        )
                      : new Container(),
                  isSelected
                      ? new Container(
                          width: MediaQuery.of(context).size.width * 0.50,
                          decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                              colors: [
                                Colors.white,
                                const Color(0xFFEFF4F8),
                                const Color(0xFFEFF4F8),
                                Colors.white,
                              ],
                            ),
                          ),
                          child: new Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: new Text(
                                title,
                                style: Themes.TextStyles.menuItemStyle,
                              ),
                            ),
                          ))
                      : Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: new Text(
                            title,
                            style: Themes.TextStyles.menuItemStyle,
                          ),
                        ),
                  isSelected
                      ? new Container(
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: 2.0,
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          decoration: new BoxDecoration(
                              gradient: new LinearGradient(
                            colors: [
                              Colors.white,
                              const Color(0xFFEFF4F8),
                              Colors.white,
                            ],
                          )),
                        )
                      : new Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

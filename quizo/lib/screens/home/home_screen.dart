import 'package:flutter/material.dart';
import 'package:quizo/screens.dart';
import 'package:quizo/screens/appbar/arcbar.dart';
import 'package:quizo/themes/Theme.dart' as Themes;
import 'package:quizo/screens/quiz/quiz_main.dart';

final Screen homeScreen = new Screen(
    title: "QUIZES",
    isSearchEnable: true,
    isMenu: false,
    pageName: 'quiz',
    conentBuilder: (BuildContext context) {
      return new Container(
        child: Stack(
          children: <Widget>[
            ArcBannerImage(
                'assets/images/bg/mb-bg-fb-06.png', 60.0, 'Choose Your Path'),
            IconCard()
          ],
        ),
      );
    });

class IconCard extends StatelessWidget {
  final List<_Posts> posts = [
    new _Posts(
        'Language',
        0xFFFE531D,
        'http://icons.iconarchive.com/icons/marcus-roberto/google-play/128/Google-Play-Books-icon.png',
        false, []),
    new _Posts(
        'Science',
        0xFF00A7AD,
        'http://icons.iconarchive.com/icons/iconleak/cerulean/128/science-chemistry-icon.png',
        false, []),
    new _Posts(
        'Drama',
        0xFFff9800,
        'http://icons.iconarchive.com/icons/icons-land/points-of-interest/128/Theater-Yellow-2-icon.png',
        false, []),
    new _Posts(
        'Art & Design',
        0xFFc0ca33,
        'http://icons.iconarchive.com/icons/itzikgur/my-seven/128/Graphics-Painting-icon.png',
        false, []),
    new _Posts(
        'Biology',
        0xFF3f51b5,
        'http://icons.iconarchive.com/icons/iconshock/super-vista-medical/128/microscope-icon.png',
        false, []),
    new _Posts(
        'Physics',
        0xFF9c27b0,
        'http://icons.iconarchive.com/icons/tpdkdesign.net/refresh-cl/128/Misc-Tutorial-icon.png',
        false, []),
    new _Posts(
        'Computer',
        0xFFbdbdbd,
        'http://icons.iconarchive.com/icons/icons-land/vista-hardware-devices/128/Portable-Computer-icon.png',
        false, [])
  ];

  @override
  Widget build(BuildContext context) {
    return new Container(
      // transform:new Matrix4.translationValues(0.0, 70.0, 0.0),
      margin: EdgeInsets.only(top: 60.0),
      child: GridView.count(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this would produce 2 rows.
        crossAxisCount: 2,
        // Generate 100 Widgets that display their index in the List
        children: List.generate(posts.length, (index) {
          return new CategoryQuestion(
            posts: posts[index],
          );
        }),
      ),
    );
  }
}

class CategoryQuestion extends StatefulWidget {
  final _Posts posts;
  CategoryQuestion({this.posts});

  @override
  _CategoryQuestionState createState() => _CategoryQuestionState();
}

class _CategoryQuestionState extends State<CategoryQuestion> {
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      print(newValue);
      widget.posts.isSelect = newValue;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => QuizScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var unselectText = new Text(
      widget.posts.title,
      style: Themes.TextStyles.quizIconBoxStyle,
    );

    var selectedText = new Container(
      decoration: new BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.all(new Radius.circular(25.0))),
      padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
      child: new Text(
        widget.posts.title,
        style: Themes.TextStyles.quizIconBoxSelectStyle,
      ),
    );

    return new GestureDetector(
      onTap: () {
        _handleTapboxChanged(!widget.posts.isSelect);
      },
      child: new Column(
        children: <Widget>[
          new Container(
              width: 120.0,
              height: 120.0,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                  color: Color(widget.posts.color),
                  borderRadius:
                      new BorderRadius.all(new Radius.circular(60.0))),
              child: new SizedBox(
                width: 80.0,
                height: 80.0,
                child: new Image(
                  alignment: Alignment.center,
                  image: new NetworkImage(widget.posts.imgSrc),
                ),
              )),
          new Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: widget.posts.isSelect ? selectedText : unselectText,
          )
        ],
      ),
    );
  }
}

class _Posts {
  final String title;
  final int color;
  final String imgSrc;
  bool _isSelect;
  final List<_Posts> postLists;

  bool get isSelect => _isSelect != null ? _isSelect : false;
  set isSelect(bool newVal) {
    this._isSelect = newVal;
  }

  _Posts(this.title, this.color, this.imgSrc, this._isSelect, this.postLists);
}

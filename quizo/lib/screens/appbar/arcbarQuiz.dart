import 'package:flutter/material.dart';
import 'package:quizo/themes/Theme.dart' as Themes;

class ArcBannerColors extends StatelessWidget {
  ArcBannerColors(this.imageUrl, this.screenHeight, this.text, this.qHeaderText,
      this.currentQuestion, this.totalQuestions);

  final String imageUrl;
  final double screenHeight;
  final String text;
  final String qHeaderText;
  final int currentQuestion;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      constraints:
          new BoxConstraints(maxHeight: screenHeight, minHeight: screenHeight),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(color: Colors.transparent),
            child: ClipPath(
              clipper: ArcClipper(),
              child: new Container(
                decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1.0,
                        blurRadius: 2.0,
                      )
                    ],
                    gradient: LinearGradient(
                        colors: Themes.CustomColors.mainQuizLinearColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
            ),
          ),
//          new SizedBox(height: 48.0),
          new Container(
              padding: new EdgeInsets.only(
                  left: 5.0, top: MediaQuery.of(context).padding.top),
              child: new Material(
                color: Colors.transparent,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: new IconButton(
                        icon: new Icon(
                          Icons.arrow_back,
                          color: Themes.CustomColors.whiteCol,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: new Column(
                          children: <Widget>[
                            new Text(
                              qHeaderText,
                              style: Themes.TextStyles.quizQutionHeaderStyle,
                            ),
                            new Text(
                              'Question $currentQuestion/$totalQuestions',
                              style: Themes.TextStyles.quizQutionSubHeaderStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: new IconButton(
                        icon: new Icon(
                          Icons.more_vert,
                          color: Themes.CustomColors.whiteCol,
                        ),
                        onPressed: () {
//                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              )),
          new Container(
            margin: EdgeInsets.only(top: 80.0, bottom: 10.0),
            child: new SizedBox(
              height: screenHeight,
              child: new SingleChildScrollView(
                primary: true,
                padding: new EdgeInsets.only(
                    left: 16.0, top: 10.0, bottom: 10.0, right: 16.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: new Text(
                      text,
                      textScaleFactor: 1.1,
                      style: Themes.TextStyles.quizQutionStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    // path.fillType = PathFillType.evenOdd;
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

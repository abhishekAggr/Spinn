import 'package:flutter/material.dart';
import 'package:quizo/themes/Theme.dart' as Themes;

class ArcBannerImage extends StatelessWidget {
  ArcBannerImage(this.imageUrl, this.screenHeight, this.text);
  final String imageUrl;
  final double screenHeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      constraints:
          new BoxConstraints(maxHeight: screenHeight, minHeight: screenHeight),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(color: Colors.transparent,
            gradient: new LinearGradient(colors: [
              Colors.blue,
              Colors.yellow
            ])),
            child: ClipPath(
              clipper: ArcClipper(),
              child: Image.asset(
                imageUrl,
                width: screenWidth,
                height: screenHeight,
                fit: BoxFit.cover,
                color: Color(0xFFF5CBFF),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          new SizedBox(
            height: screenHeight,
            child: new SingleChildScrollView(
              padding:
                  new EdgeInsets.only(left: 16.0, top: 10.0, bottom: 10.0, right: 16.0),
              child: new Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: new Text(
                      text,
                      style: Themes.TextStyles.arcbarStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
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

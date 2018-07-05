import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:quizo/screens/appbar/arcbarQuiz.dart';
import 'package:quizo/themes/Theme.dart' as Themes;

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  bool isFlagged = false;
  bool isFav = false;
  bool isAlreadyAnswered = false;

  handleFlagPressed(newVal) {
    setState(() {
      isFlagged = newVal;
    });
  }

  handleFavPressed(newVal) {
    setState(() {
      isFav = newVal;
    });
  }

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      isAlreadyAnswered = newValue;
      startStopTimer();
    });
  }

  AnimationController _controller;

  String get timerString {
    Duration duration = _controller.duration * _controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60)
        .toString()
        .padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => startStopTimer());
  }

  startStopTimer() {
    if (_controller.isAnimating)
      _controller.stop();
    else {
      _controller.reverse(
          from: _controller.value == 0.0 ? 1.0 : _controller.value);
    }
  }

  @override
  void dipose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          child: new Material(
        color: Colors.transparent,
        child: new Column(
          children: <Widget>[
            ArcBannerColors(
                'assets/images/bg/mb-bg-fb-06.png',
                300.0,
                'Which of the following enzymes convert glucose into glucose-6-p during glycosis? ',
                'Molecular Biology',
                2,
                20),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 8.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new MultipleOptions(
                      answer: 'Fructokinase',
                      isCorrect: false,
                      isAnswered: isAlreadyAnswered,
                      onChanged: _handleTapboxChanged),
                  new MultipleOptions(
                    answer: 'Hexokinase',
                    isCorrect: true,
                    isAnswered: isAlreadyAnswered,
                    onChanged: _handleTapboxChanged,
                  ),
                  new MultipleOptions(
                      answer: 'PEP carboxikinase',
                      isCorrect: false,
                      isAnswered: isAlreadyAnswered,
                      onChanged: _handleTapboxChanged),
                  new MultipleOptions(
                      answer: 'Piruvalet Carboxylase',
                      isCorrect: false,
                      isAnswered: isAlreadyAnswered,
                      onChanged: _handleTapboxChanged)
                ],
              ),
            )),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Stack(
                children: <Widget>[
                  new Container(
                    height: 66.0,
                    margin: EdgeInsets.only(top: 30.0),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[200],
                    child: Row(
                      children: <Widget>[
                        new Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: Icon(Icons.flag),
                            onPressed: () {
                              handleFlagPressed(!isFlagged);
                            },
                            color: !isFlagged
                                ? Colors.blueGrey
                                : Theme.of(context).accentColor,
                            splashColor: Colors.transparent,
                          ),
                        ),
                        Expanded(child: Text('')),
                        new Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(!isFav
                                ? Icons.favorite_border
                                : Icons.favorite),
                            onPressed: () {
                              handleFavPressed(!isFav);
                            },
                            color: !isFav
                                ? Colors.blueGrey
                                : Theme.of(context).accentColor,
                            splashColor: Colors.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Stack(
                          children: <Widget>[
                            new SizedBox(
                              width: 70.0,
                              height: 85.0,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: AnimatedBuilder(
                                  animation: _controller,
                                  builder:
                                      (BuildContext context, Widget child) {
                                    return new CustomPaint(
                                        painter: TimerPainter(
                                      animation: _controller,
                                      backgroundColor: Colors.deepOrange,
                                      color: Colors.grey,
                                    ));
                                  },
                                ),
                              ),
                            ),
                            new SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 33.0),
                                  child: AnimatedBuilder(
                                      animation: _controller,
                                      builder:
                                          (BuildContext context, Widget child) {
                                        return new Text(
                                          timerString,
                                          textAlign: TextAlign.center,
                                          textScaleFactor: 1.7,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Nuinto',
                                              fontSize: 16.0),
                                        );
                                      }),
                                )),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class MultipleOptions extends StatefulWidget {
  final String answer;
  final bool isCorrect;
  final bool isAnswered;
  final ValueChanged<bool> onChanged;

  MultipleOptions(
      {Key key,
      this.answer,
      this.isCorrect,
      this.isAnswered,
      @required this.onChanged})
      : super(key: key);

  @override
  _MultipleOptionsState createState() => _MultipleOptionsState();
}

class _MultipleOptionsState extends State<MultipleOptions> {
  TextStyle style = Themes.TextStyles.defaultAnswerStyle;
  Color defaultColor = Colors.grey[300];
  List<Color> listColor = [Colors.transparent, Colors.transparent];

  _handelTap() {
    setState(() {
      if (widget.isCorrect) {
        style = Themes.TextStyles.correctAnswerStyle;
        defaultColor = Colors.lightGreen;
        listColor = Themes.CustomColors.rightAnswerColors;
      } else {
        style = Themes.TextStyles.defaultAnswerStyle;
        defaultColor = Colors.deepOrangeAccent;
        listColor = Themes.CustomColors.wrongAnswerColors;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        if (!widget.isAnswered) {
          widget.onChanged(!widget.isAnswered);
          _handelTap();
        }
      },
      child: new Container(
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
            gradient: LinearGradient(colors: listColor),
            border: new Border.all(
              style: BorderStyle.solid,
              color: defaultColor,
              width: 2.0,
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(10.0))),
        margin: EdgeInsets.only(
            top: 8.0,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1),
        padding: EdgeInsets.all(12.0),
        child: Text(
          widget.answer,
          style: style,
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor, color;

  TimerPainter({this.animation, this.backgroundColor, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor || animation.value == 0.0;
  }
}

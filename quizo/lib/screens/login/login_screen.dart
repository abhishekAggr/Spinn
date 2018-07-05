import 'package:flutter/material.dart';
import 'package:quizo/auth.dart';
import 'package:quizo/data/database_helper.dart';
import 'package:quizo/models/user.dart';
import 'package:quizo/screens/login/login_screen_presenter.dart';
import 'package:quizo/my_flutter_app_icons.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>
    implements LoginScreenContract, AuthStateListener {
  BuildContext _ctx;

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _username, _password;

  LoginScreenPresenter _presenter;

  LoginScreenState() {
    _presenter = new LoginScreenPresenter(this);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() => _isLoading = true);
      form.save();
      _presenter.doLogin(_username, _password);
    }
    // TODO: REMOVE AFTER API IMPLEMENT
     Navigator.of(_ctx).pushReplacementNamed("/home");
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  onAuthStateChanged(AuthState state) {
    if (state == AuthState.LOGGED_IN)
      Navigator.of(_ctx).pushReplacementNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/logo.png'),
      ),
    );

    final logoText = new Center(
      child: new Text(
        'Quizo App',
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Nunito',
            fontSize: 34.0,
            fontWeight: FontWeight.bold),
      ),
    );

    final logoTextTag = new Center(
      child: new Text(
        'Login to continue',
        style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontFamily: 'Nunito',
            fontSize: 14.0,
            fontWeight: FontWeight.w100),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            _submit();
          },
          color: Theme.of(context).accentColor,
          child: Text('LOGIN',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal)),
        ),
      ),
    );

    final fbButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 0.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 48.0,
          onPressed: () {},
          color: Colors.blue[900],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                MyFlutterApp.facebook_official,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Login with facebook',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal)),
              ),
            ],
          ),
        ),
      ),
    );

    var loginForm = new Column(
      children: <Widget>[
        // new Text(
        //   "Login App",
        //   textScaleFactor: 2.0,
        // ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val,
                  validator: (val) {
                    return val.length < 8
                        ? "Username must have atleast 10 chars"
                        : null;
                  },
                  decoration: new InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                          // color: Colors.black, 
                          // decorationColor: Colors.white,
                          )
                          ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  onSaved: (val) => _password = val,
                  validator: (val) {
                    return val.length < 5
                        ? "Password must have atleast 6 chars"
                        : null;
                  },
                  decoration: new InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                          // color: Colors.white, decorationColor: Colors.white
                          )
                          ),
                ),
              ),
            ],
          ),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );

    final forgotLabel = FlatButton(
      padding: EdgeInsets.only(left: 160.0),
      child: new Center(
          child: new Text(
        'Forgot password?',
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.black54),
      )),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/bg/bg-030.jpg"),
                colorFilter: new ColorFilter.mode(
                   Colors.white, BlendMode.difference),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                logo,
                logoText,
                logoTextTag,
                SizedBox(height: 30.0),
                loginForm,
                forgotLabel,
                _isLoading ? new Center(
                  child: new SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: new CircularProgressIndicator(
                      value: null,
                      strokeWidth: 5.0,
                    ),
                  ),
                ) : loginButton,
                SizedBox(height: 48.0),
              ],
            ),
          ),
          new Align(
            alignment: FractionalOffset.bottomCenter,
            child: fbButton,
          )
        ],
      ),
    );
  }

  @override
  void onLoginError(String errorTxt) {
    _showSnackBar(errorTxt);
    setState(() => _isLoading = false);
  }

  @override
  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    setState(() => _isLoading = false);
    var db = new DatabaseHelper();
    await db.saveUser(user);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.notify(AuthState.LOGGED_IN);
  }
}

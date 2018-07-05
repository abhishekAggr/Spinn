import 'package:flutter/material.dart';
import 'package:quizo/screens/home/main_screen.dart';
import 'package:quizo/screens/login/login_screen.dart';
import 'package:quizo/screens/menu/main_menu.dart';

final routes = {
  '/login': (BuildContext context) => new LoginScreen(),
  '/home': (BuildContext context) => new MainScreen(),
  '/menu': (BuildContext context) => new MenuScreen(),
  '/': (BuildContext context) => new LoginScreen(),
};

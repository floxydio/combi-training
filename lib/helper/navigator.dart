import 'package:flutter/material.dart';

class RouteNavigator {
  static void pushReplace(Widget name, BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => name));
  }

  static void push(Widget name, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => name));
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
  
}



// RouteNavigator.push()
// RouteNavigator().push()
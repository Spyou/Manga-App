import 'package:flutter/cupertino.dart';

Future openScreen(BuildContext context, Widget screenName) {
  return Navigator.push(context, CupertinoPageRoute(builder: (_) => screenName));
}

Future openReplaceScreen(BuildContext context, Widget screenName) {
  return Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => screenName));
}

// Future openReplaceScreen(BuildContext context, Widget screenName) {
//   return Navigator.push(context, CupertinoPageRoute(builder: (_) => screenName));
// }

Future openMainScreen(BuildContext context, Widget screenName) {
  return Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_) => screenName), (Route<dynamic> route) => false);
}

void closeScreen(BuildContext context) {
  Navigator.pop(context);
}

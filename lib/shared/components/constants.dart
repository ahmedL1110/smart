import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void navigatorTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigatorFinished(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route) {
    return false;
  },
);

dynamic uId;
bool isAr = false;
import 'package:flutter/material.dart';

///////////  Start navigate And Finish Method /////////////
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (route) =>
    false); //////////////////=> return false or true <==////////////////
///////////  End navigate And Finish Method /////////////

void navigate(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => widget),); //////////////////=> return false or true <==////////////////
///////////  End navigate And Finish Method /////////////
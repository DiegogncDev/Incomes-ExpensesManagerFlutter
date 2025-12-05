import 'package:flutter/material.dart';

class MyTextTheme {
  
   TextTheme getMyTextTheme(BuildContext context) {

    final myTextTheme = Theme.of(context).textTheme;

    return myTextTheme;

  }

}
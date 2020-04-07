import 'package:flutter/material.dart';

import 'frame.dart';

class UAChiAlphaApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'UA XA',
      home: Frame(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.redAccent[700],
        indicatorColor: Colors.red[900],
        primaryIconTheme: IconThemeData(
          color: Colors.black54,
        ),
        primaryTextTheme: TextTheme(
          button: TextStyle(
            color: Colors.black87,
          ),
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
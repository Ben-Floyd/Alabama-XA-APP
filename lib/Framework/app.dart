import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:alabamachialph/Framework/frame.dart';
import 'package:alabamachialph/menu.dart';
import 'file:///C:/Users/ben_j/AndroidStudioProjects/alabama_chi_alpha/lib/Account/login.dart';
import 'file:///C:/Users/ben_j/AndroidStudioProjects/alabama_chi_alpha/lib/Account/user.dart';
import 'package:alabamachialph/unknown.dart';
import 'file:///C:/Users/ben_j/AndroidStudioProjects/alabama_chi_alpha/lib/Account/createAccount.dart';
import 'package:alabamachialph/settings.dart';

User user;

class MenuArguments
{
  final String page;
  final TabController tabController;

  MenuArguments(this.page, this.tabController);
}

class UAChiAlphaApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'UA XA',
      home: Frame(),
      onGenerateRoute: (settings)
      {
        if (settings.name == '/menu')
        {
          final MenuArguments args = settings.arguments;

          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  MenuPage(currentPage: args.page,//_tabs[_tabController.index],
                    tc: args.tabController,),
              transitionsBuilder: (context, animation, secondaryAnimation,
                  child) {
                var begin = Offset(-1, 0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                    CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              }
          );
        }
        else if (settings.name == '/login')
        {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1, 0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                    CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              }
          );
        }
        else if (settings.name == '/createAccount')
        {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => CreateAccountPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1, 0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                    CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              }
          );
        }
        else if (settings.name == '/user')
        {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => UserPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1, 0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                    CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              }
          );
        }
        else if (settings.name == "/settings")
        {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => SettingsPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = Offset(1, 0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                    CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              }
          );
        }
        else
        {
          return MaterialPageRoute(builder: (context) => UnknownPage());
        }
      },
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
          caption: TextStyle(
            fontSize: 10,
          ),
          bodyText1: TextStyle(
            fontSize: 15,
            color: Colors.black54,
          ),
          headline1: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          headline3: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          overline: TextStyle(
            color: Colors.red[900],
            fontSize: 15,
          )
        ),
        buttonColor: Colors.grey,
        textSelectionColor: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
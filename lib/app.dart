import 'package:flutter/material.dart';

import 'frame.dart';
import 'menu.dart';
import 'unknown.dart';

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
                    tabController: args.tabController,),
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

        return MaterialPageRoute(builder: (context) => UnknownPage());
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
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
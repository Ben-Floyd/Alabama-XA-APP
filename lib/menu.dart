import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

import 'file:///C:/Users/ben_j/AndroidStudioProjects/alabama_chi_alpha/lib/MainPages/news.dart';
import 'file:///C:/Users/ben_j/AndroidStudioProjects/alabama_chi_alpha/lib/MainPages/pray.dart';
import 'file:///C:/Users/ben_j/AndroidStudioProjects/alabama_chi_alpha/lib/MainPages/teams.dart';
import 'file:///C:/Users/ben_j/AndroidStudioProjects/alabama_chi_alpha/lib/MainPages/missions.dart';
import 'file:///C:/Users/ben_j/AndroidStudioProjects/alabama_chi_alpha/lib/MainPages/about.dart';

class MenuPage extends StatelessWidget {

  final String currentPage;
  static TabController _tabController;
  final TabController tc;
  final List<String> _pages = const ['Home', 'News', 'D-Group', 'Events', 'Library', 'Pray', 'Teams', 'Missions', 'About'];

  MenuPage({
    Key key,
    @required this.currentPage,
    this.tc,
    //@required this.onPageTap,
  }) : assert(currentPage != null)
  {
    if (tc != null)
      _tabController = tc;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).textTheme.button.color,),
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
        title: Text('Menu', style: TextStyle(color: Theme.of(context).textTheme.button.color),),
        actions: <Widget>
        [
          IconButton(
            icon: Icon(Icons.settings, color: Theme.of(context).textTheme.button.color,),
            onPressed: ()
            {
              Navigator.pushNamed(context, "/settings");
            },
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 40),
          child: ListView(
            children: _pages.map((String p)
            => _buildPageListing(p, context)).toList(),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
              FlatButton(
                padding: EdgeInsets.only(left: 60),
                child: Text("Feedback", style: TextStyle(fontSize: 15),),
                textColor: Theme.of(context).textSelectionColor,
                onPressed: ()
                {
                  //TODO
                },
              ),
              FlatButton(
                padding: EdgeInsets.only(right: 30),
                child: Row(
                  children: <Widget>[
                    Text("Bug Report", style: Theme.of(context).primaryTextTheme.button,),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Icon(Icons.bug_report, color: Colors.green,),
                  ],
                ),
                onPressed: ()
                {
                  // TODO
                },
              ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _buildPageListing(String page, BuildContext context)
  {
    return ListTile(
      onTap: ()
      {
        bool valid = false;

        if (['Home', 'D-Group', 'Events', 'Library'].contains(currentPage))
        {
          valid = true;
          switch(page)
          {
            case 'Home':
              _tabController.index = 0;
              Navigator.pop(context);
              break;
            case 'D-Group':
              _tabController.index = 1;
              Navigator.pop(context);
              break;
            case 'Events':
              _tabController.index = 2;
              Navigator.pop(context);
              break;
            case 'Library':
              _tabController.index = 3;
              Navigator.pop(context);
              break;
            default:
              valid = false;
          }
        }

        if (!valid)
        {
          switch(page)
          {
            case 'News':
              Navigator.pushReplacement(context, _createNewsRoute());
              break;
            case 'Pray':
              Navigator.pushReplacement(context, _createPrayRoute());
              break;
            case 'Teams':
              Navigator.pushReplacement(context, _createTeamsRoute());
              break;
            case 'Missions':
              Navigator.pushReplacement(context, _createMissionsRoute());
              break;
            case 'About':
              Navigator.pushReplacement(context, _createAboutRoute());
              break;
            case 'Home':
              Navigator.popUntil(context, ModalRoute.withName('/'));
              _tabController.index = 0;
              break;
            case 'D-Group':
              Navigator.popUntil(context, ModalRoute.withName('/'));
              _tabController.index = 1;
              break;
            case 'Events':
              Navigator.popUntil(context, ModalRoute.withName('/'));
              _tabController.index = 2;
              break;
            case 'Library':
              Navigator.popUntil(context, ModalRoute.withName('/'));
              _tabController.index = 3;
              break;
            default:
              valid = false;
          }
        }
      },
      title: page == currentPage
          ? Column(
        children: <Widget>[
          SizedBox(height: 16.0,),
          Text(
            page,
            style: TextStyle(
              color: Theme.of(context).textTheme.button.color,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14.0),
          Container(
            width: 70.0,
            height: 2.0,
            color: Theme.of(context).indicatorColor,
          ),
        ],
      )
          : Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          page,
          style: TextStyle(
            color: Theme.of(context).textTheme.button.color.withAlpha(100),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Route _createNewsRoute()
  {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => NewsPage(),
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

  Route _createPrayRoute()
  {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => PrayPage(),
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

  Route _createTeamsRoute()
  {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => TeamsPage(),
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

  Route _createMissionsRoute()
  {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => MissionsPage(),
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

  Route _createAboutRoute()
  {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => AboutPage(),
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
}
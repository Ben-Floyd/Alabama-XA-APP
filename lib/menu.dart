import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

import 'settings.dart';
import 'frame.dart';

class MenuPage extends StatelessWidget {

  final String currentPage;
  final TabController tabController;
  final List<String> _pages = const ['Home', 'News', 'D-Group', 'Events', 'Library', 'Pray', 'Teams', 'Missions', 'About'];

  MenuPage({
    Key key,
    @required this.currentPage,
    this.tabController,
    //@required this.onPageTap,
  }) : assert(currentPage != null);
     //assert(onPageTap != null);

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
              Navigator.of(context).push(_createSettingsRoute());
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
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _buildPageListing(String page, BuildContext context)
  {
    return ListTile(
      onTap: ()
      {
        //currentPage = page;
        if (tabController != null)
        {
          switch(page)
          {
            case 'Home':
              tabController.index = 0;
              break;
            case 'D-Group':
              tabController.index = 1;
              break;
            case 'Events':
              tabController.index = 2;
              break;
            case 'Library':
              tabController.index = 3;
              break;
            default:

          }
        }

        Navigator.pop(context);
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

  Route _createSettingsRoute() {
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
}
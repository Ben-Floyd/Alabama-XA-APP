import 'package:alabamachialph/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'menu.dart';
import 'login.dart';

class Frame extends StatefulWidget
{
  @override
  _FrameState createState() => _FrameState();
}

class _FrameState extends State<Frame>
{
  @override
  void initState()
  {
    super.initState();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: TabBarView(
          children: <Widget>[
            _buildScrollable('Home'),
            _buildScrollable('D-Group'),
            _buildScrollable('Events'),
            _buildScrollable('Library'),
          ],
        ),
        initialIndex: 0,
      ),
    );
  }

  Widget _buildScrollable(String tab)
  {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black54,
            ),
            iconSize: 40,
            tooltip: 'Menu',
            onPressed: ()
            {
              Navigator.of(context).push(_createMenuRoute());
            },
          ),
          title: Image(
            image: AssetImage('res/xa_alabama_logo_transparent.png'),
            //TODO onPress scroll to top
            height: 60,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.redAccent[700],
              ),
              iconSize: 40,
              tooltip: 'Profile',
              onPressed: ()
              {
                Navigator.of(context).push(_createLoginRoute());
              },
            ),
          ],

          bottom: TabBar(
            labelColor: Colors.redAccent[700],
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.redAccent[700],
            tabs: <Widget>[
              Tab(child: Icon(Icons.home),),
              Tab(child: Icon(Icons.group),),
              Tab(child: Icon(Icons.event_note),),
              Tab(child: Icon(Icons.local_library),),
            ],
          ),
          //expandedHeight: 205,
          backgroundColor: Colors.white70,
          centerTitle: true,
          floating: true,
        ),

        _buildContent(context, tab),
      ],
    );
  }

  Widget _buildContent(BuildContext context, String tab)
  {
    switch(tab)
    {
      case 'Home':
        return HomeTab();
        break;
      case 'D-Group':
        //TODO return DGroupTab();
        return SliverFillRemaining(
          child: Icon(Icons.group),
        );
        break;
      case 'Events':
        //TODO return EventsTab();
        return SliverFillRemaining(
          child:Icon(Icons.event_note),
        );
        break;
      case 'Library':
        //TODO return LibraryTab();
        return SliverFillRemaining(
          child: Icon(Icons.local_library),
        );
        break;
      default:
        return Text('Invalid Tab');
    }
  }

  Route _createMenuRoute()
  {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Menu(currentPage: 'Home',),
        transitionsBuilder: (context, animation, secondaryAnimation, child)
        {
          var begin = Offset(-1, 0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        }
    );
  }

  Route _createLoginRoute() {
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
}
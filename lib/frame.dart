import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'menu.dart';
import 'login.dart';
import 'home.dart';

class Frame extends StatefulWidget
{
  @override
  _FrameState createState() => _FrameState();

  void gotoTab()
  {

  }
}

class _FrameState extends State<Frame>
{
  final List<String> _tabs = ['Home', 'D-Group', 'Events', 'Library'];

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
        length: _tabs.length, // This is the number of tabs.
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Theme.of(context).primaryIconTheme.color,
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
                      color: Theme.of(context).accentColor,
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

                  labelColor: Theme.of(context).accentColor,
                  unselectedLabelColor: Theme.of(context).primaryIconTheme.color,
                  indicatorColor: Theme.of(context).accentColor,
                  tabs: <Widget>[
                    Tab(child: Icon(Icons.home),),
                    Tab(child: Icon(Icons.group),),
                    Tab(child: Icon(Icons.event_note),),
                    Tab(child: Icon(Icons.local_library),),
                  ],
                ),
                backgroundColor: Theme.of(context).primaryColor.withAlpha(200),
                centerTitle: true,
                floating: true,
                snap: true,
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: _tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  // This Builder is needed to provide a BuildContext that is "inside"
                  // the NestedScrollView, so that sliverOverlapAbsorberHandleFor() can
                  // find the NestedScrollView.
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      // The "controller" and "primary" members should be left
                      // unset, so that the NestedScrollView can control this
                      // inner scroll view.
                      // If the "controller" property is set, then this scroll
                      // view will not be associated with the NestedScrollView.
                      // The PageStorageKey should be unique to this ScrollView;
                      // it allows the list to remember its scroll position when
                      // the tab view is not on the screen.
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        _buildContent(context, name),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
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
        pageBuilder: (context, animation, secondaryAnimation) => MenuPage(currentPage: 'Home',),
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

import 'package:alabamachialph/Tabs/dgroup.dart';
import 'package:alabamachialph/Tabs/events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import '../Tabs/home.dart';
import '../user.dart';

class Frame extends StatefulWidget
{
  @override
  _FrameState createState() => _FrameState();
}

class _FrameState extends State<Frame> with SingleTickerProviderStateMixin
{
  static final List<String> _tabs = ['Home', 'D-Group', 'Events', 'Library'];
  TabController _tabController;

  bool _displayFAB = false;

  @override
  void initState()
  {
    super.initState();

    _tabController = TabController(vsync: this, length: _tabs.length, initialIndex: 0);
    
    _tabController.addListener(()
    {
      if (!_tabController.indexIsChanging)
      {
        if (_tabController.index == 2)
        {
          setState(() {
            _displayFAB = true;
          });
        }
        else
        {
          setState(() {
            _displayFAB = false;
          });
        }
      }
    });

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        body: NestedScrollView(
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
                    Navigator.pushNamed(context, '/menu', arguments: MenuArguments(_tabs[_tabController.index], _tabController));
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
                      color: user != null ? Theme.of(context).accentColor : Theme.of(context).primaryIconTheme.color,
                    ),
                    iconSize: 40,
                    tooltip: 'Profile',
                    onPressed: ()
                    {
                      if (user != null)
                      {
                        Navigator.pushNamed(context, '/user');
                      }
                      else
                      {
                        _login(context);
                      }
                    },
                  ),
                ],

                bottom: TabBar(
                  controller: _tabController,
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
            controller: _tabController,
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
      floatingActionButton: FloatingActionButton(
        child: (_displayFAB) ? Icon(Icons.add, color: Theme.of(context).accentColor) : null ,
        mini: false,
        backgroundColor: (_displayFAB) ? Theme.of(context).primaryColor : Colors.transparent,
        splashColor: Theme.of(context).accentColor,
        elevation: 10.0,
        disabledElevation: 0.0,
        onPressed: (_displayFAB) ? (){_tabController.index=0;} : null ,//TODO add Event
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
        return DGroupTab();
        break;
      case 'Events':
        return EventsTab();
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

  _login(BuildContext context) async
  {
    final result = await Navigator.pushNamed(context, '/login');

    if (result != 'Cancel' && result != null)
    {
      if (result == 'Failed')
      {
        Scaffold.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text('Login Unsuccessful'),
            duration: Duration(seconds: 2),
          ));
      }
      else
      {
        user = result;
        Scaffold.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text("Loged in as " + user.getName()),
            duration: Duration(seconds: 2),
          ));
      }
    }
  }
}

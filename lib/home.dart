import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:english_words/english_words.dart';

import 'menu.dart';
import 'login.dart';

final allNames = <WordPair>[];

class HomePage extends StatefulWidget
{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  @override
  void initState()
  {
    super.initState();

    allNames.addAll(generateWordPairs().take(100));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: _buildScrollable(),
        initialIndex: 0,
      ),
    );
  }

  Widget _buildScrollable()
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

        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) => _buildRow(context, allNames[index]),
            childCount: 100,
          ),
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context, WordPair pair)
  {
    return Card (
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 2.0/1.0,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }

  Route _createMenuRoute()
  {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Menu(),
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
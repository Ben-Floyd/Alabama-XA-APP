import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

class Menu extends StatelessWidget {

  String currentPage;
  //final ValueChanged<String> onPageTap;
  final List<String> _pages = const ['Home', 'News', 'D-Group', 'Events', 'Library', 'About'];

  Menu({
    Key key,
    @required this.currentPage,
    //@required this.onPageTap,
  }) : assert(currentPage != null);
     //assert(onPageTap != null);

  Widget _buildPageListing(String page, BuildContext context)
  {
    return GestureDetector(
      onTap: ()
        {
          if (page == currentPage)
            Navigator.pop(context);
          else
            currentPage == page;
        },
      child: page == currentPage
        ? Column(
          children: <Widget>[
            SizedBox(height: 16.0,),
            Text(
              page,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 14.0),
            Container(
              width: 70.0,
              height: 2.0,
              color: Colors.red[900],
            ),
          ],
        )
        : Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            page,
            textAlign: TextAlign.center,
          ),
      )
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,),
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
        title: Text('Menu',),
        backgroundColor: Colors.red[700],
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
      backgroundColor: Colors.red[700],
    );
  }
}
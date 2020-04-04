import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:english_words/english_words.dart';

import 'menu.dart';
import 'login.dart';

final allNames = <WordPair>[];

class HomeTab extends StatefulWidget
{
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab>
{
  @override
  void initState()
  {
    super.initState();

    allNames.addAll(generateWordPairs().take(100));
  }

  @override
  Widget build(BuildContext context)
  {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) => _buildRow(context),
        childCount: 100,
      ),
    );
  }

  Widget _buildRow(BuildContext context)
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
}
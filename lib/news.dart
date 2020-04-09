import 'package:flutter/material.dart';

import 'Framework/appBar.dart';

class NewsPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: generateAppBar(context, 'News'),
      body: Center(
        child: Icon(Icons.library_books),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'Framework/appBar.dart';

class PrayPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: generateAppBar(context, 'Pray',),
      body: Center(
        child: Icon(Icons.book),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:alabamachialph/Framework/appBar.dart';

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
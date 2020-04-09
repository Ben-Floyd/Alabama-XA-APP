import 'package:flutter/material.dart';

import 'Framework/appBar.dart';

class TeamsPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: generateAppBar(context, 'Teams'),
      body: Center(
        child: Icon(Icons.group_work),
      ),
    );
  }
}
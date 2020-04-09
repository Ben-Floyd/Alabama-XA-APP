import 'package:flutter/material.dart';

import 'Framework/appBar.dart';

class MissionsPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: generateAppBar(context, 'Missions'),
      body: Center(
        child: Icon(Icons.language),
      ),
    );
  }
}
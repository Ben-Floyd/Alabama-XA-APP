import 'package:flutter/material.dart';

import 'package:alabamachialph/Framework/appBar.dart';

class AboutPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: generateAppBar(context, 'About'),
      body: Center(
        child: Icon(Icons.info),
      ),
    );
  }
}
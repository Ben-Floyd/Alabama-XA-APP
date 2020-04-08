import 'package:flutter/material.dart';

class TeamsPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).textTheme.button.color,),
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Teams'),
      ),
      body: Center(
        child: Icon(Icons.group_work),
      ),
    );
  }
}
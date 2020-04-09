import 'package:flutter/material.dart';

class User
{
  final int userID;

  String getName()
  {
    //TODO fetch from database
    return "Benjamin Floyd";
  }

  User({@required this.userID}) : assert(userID != null);
}

class UserPage extends StatelessWidget
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
        title: Text('User'),
      ),
      body: Center(
        child: Icon(Icons.person),
      ),
    );
  }
}
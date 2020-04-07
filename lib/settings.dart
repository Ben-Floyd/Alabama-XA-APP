import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).textTheme.button.color,),
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
        title: Text('Settings', style: TextStyle(color: Theme.of(context).textTheme.button.color),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}
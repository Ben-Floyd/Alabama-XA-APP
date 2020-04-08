import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget
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
        title: Text('Error: Unknown Page'),
      ),
      body: Center(
        child: Icon(Icons.error),
      ),
    );
  }
}
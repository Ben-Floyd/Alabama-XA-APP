import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

class Menu extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,),
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
        title: Text('Menu',),
        backgroundColor: Colors.red[700],
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Text(''),
      ),
      backgroundColor: Colors.red[700],
    );
  }

  /*Widget _buildCatagory()
  {

  }*/
}
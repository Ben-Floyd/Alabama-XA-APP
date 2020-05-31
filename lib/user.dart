import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Framework/app.dart';

class User
{
  final FirebaseUser user;

  String _name = "ERROR",
      _gender = "ERROR",
      _class = "ERROR",
      _status = "ERROR";
  //TODO DGROUP

  String getName()
  {
    return _name;
  }

  String getGender()
  {
    return _gender;
  }

  String getClass()
  {
    return _class;
  }

  String getStatus()
  {
    return _status;
  }

  void _readData() async
  {
    await Firestore.instance.collection("users").document(user.uid).get().then((DocumentSnapshot ds)
    {
      _name = ds["name"];
      _gender = ds["gender"];
      _class = ds["class"];
      _status = ds["status"];
    });
  }

  User({@required this.user}) : assert(user != null)
  {
    _readData();
  }
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
        title: Text('User', style: TextStyle(color: Theme.of(context).textTheme.button.color),),
        actions: <Widget>
        [
          IconButton(
            icon: Icon(Icons.settings, color: Theme.of(context).textTheme.button.color,),
            onPressed: ()
            {
              Navigator.pushNamed(context, "/settings");
            },
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: ListView(
        children: <Widget>[
          Divider(),
          ListTile(
            leading: Text("Name:", style: Theme.of(context).primaryTextTheme.headline3,),
            title: Text(user.getName(), style: Theme.of(context).primaryTextTheme.bodyText1,),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: ()
              {
                //TODO
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Text("Gender:", style: Theme.of(context).primaryTextTheme.headline3,),
            title: Text(user.getGender(), style: Theme.of(context).primaryTextTheme.bodyText1,),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: ()
              {
                //TODO
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Text("Class:", style: Theme.of(context).primaryTextTheme.headline3,),
            title: Text(user.getClass(), style: Theme.of(context).primaryTextTheme.bodyText1,),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: ()
              {
                //TODO
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Text("Status:", style: Theme.of(context).primaryTextTheme.headline3,),
            title: Text(user.getStatus(), style: Theme.of(context).primaryTextTheme.bodyText1,),
          ),
          Divider(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Sign Out"),
              color: Theme.of(context).accentColor,
              onPressed: ()
              {
                FirebaseAuth.instance.signOut();
                user = null;
                Navigator.pop(context);
              },
            ),
          ],
        )
      )
    );
  }
}
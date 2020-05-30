import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Framework/appBar.dart';

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
      appBar:generateAppBar(context, "User"),
      body: StreamBuilder(
        stream: Firestore.instance.collection("users").snapshots(),
        builder: (context, snapshot)
        {
          if (!snapshot.hasData) return const Text("Loading...");

          return ListView.builder(
            itemExtent: 80,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index]),
          );
        }
      )
    );
  }

  Widget _buildListItem(context, DocumentSnapshot document)
  {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(document["FName"]),
          ),
          Expanded(
            child: Text(document["LName"]),
          )
        ],
      ),
    );
  }
}
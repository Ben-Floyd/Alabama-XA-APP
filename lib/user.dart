import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Framework/appBar.dart';

class User
{
  final FirebaseUser user;

  Future<String> getName() async
  {
    String name = "ERROR";
    await Firestore.instance.collection("users").document(user.uid).get().then((DocumentSnapshot ds)
    {
      name = ds["name"];
    });

    return name;
  }

  Future<String> getGender() async
  {
    String gender = "ERROR";
    await Firestore.instance.collection("users").document(user.uid).get().then((DocumentSnapshot ds)
    {
      gender = ds["gender"];
    });

    return gender;
  }

  User({@required this.user}) : assert(user != null);
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
            child: Text(document["name"]),
          ),
        ],
      ),
    );
  }
}
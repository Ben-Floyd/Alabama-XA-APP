import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:alabamachialph/Account/user.dart';
import 'package:alabamachialph/Framework/util.dart';

class EventType
{
  String name;
  Icon icon;

  EventType({
    this.name,
    this.icon,
  });
}

class Event
{
  List<EventType> types;
  User owner;
  List<User> members;
  String name;
  String description;
  //TODO time
  //TODO location

  Event({
    this.types,
    this.owner,
    this.name,
    this.description,
  });
}

class EventsTab extends StatefulWidget
{
  @override
  _EventsTabState createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab>
{
  List<EventType> _types = new List<EventType>();
  List<DocumentSnapshot> _events = new List<DocumentSnapshot>();
  bool _dataRecieved = false;

  static List<Color> chipColors = new List<Color>();
  
  @override
  void initState()
  {
    super.initState();
    
    _readData();
  }
  
  @override
  Widget build(BuildContext context) {
    if (!_dataRecieved)
    {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => _buildProgressIndicator(context, index),
          childCount: 2,
        ),
      );
    }
    else
    {
      return StreamBuilder(
        stream: Firestore.instance.collection('events').snapshots(),
        builder: (context, snapshot)
          {
            if (!snapshot.hasData)
            {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => _buildProgressIndicator(context, index),
                  childCount: 2,
                ),
              );
            }
            else
            {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => _buildRow(context, index, snapshot.data.documents[index]),
                  childCount: snapshot.data.documents.length,
                ),
              );
            }
          }
      );
    }
  }

  Widget _buildProgressIndicator(BuildContext context, int index)
  {
    if (index == 1) {
      return SizedBox(
        height: 35,
        width: 1,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    else
    {
      return SizedBox(
        height: 50,
      );
    }
  }

  Widget _buildRow(BuildContext context, int index, DocumentSnapshot ds)
  {
    if (ds["types"] == null)
    {
      _events.add(ds);
    }

    if (index == 0)
    {
      return SizedBox(
        height: 80,
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: ListView(
            children: _buildTypeChips(context),
            scrollDirection: Axis.horizontal,
          ),
        ),
      );
    }
    else if (_events.isNotEmpty)
    {
      return _buildEvent(context, _events.removeLast());
    }
  }

  _buildTypeChips(BuildContext context)
  {
    //TODO make filters and events list
    var filterChips = List<Widget>();

    filterChips.add(SizedBox(width: 15,));

    for(int i = 0; i < _types.length; i++)
    {
      if (i > chipColors.length - 1)
      {
        chipColors.add(Theme.of(context).buttonColor);
      }

      //TODO sort chips by selection
      filterChips.add(
          GestureDetector(
            onTap: ()
            {
              if (chipColors[i] != Theme.of(context).accentColor)
              {
                setState(() {
                  chipColors[i] = Theme.of(context).accentColor;
                  //TODO activate filter
                });
              }
              else
              {
                setState(() {
                  chipColors[i] = Theme.of(context).buttonColor;
                  //TODO deactivate filter
                });
              }
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(2),
                    ),
                    _types[i].icon,
                    Text(_types[i].name),
                  ],
                ),
                radius: 35,
                backgroundColor: chipColors[i].withAlpha(150),
                foregroundColor: Theme.of(context).primaryTextTheme.button.color,
              ),
            ),
          )
      );
    }
    return filterChips;
  }

  //TODO create object people
  //TODO add DateTime to params
  //TODO add list of people to params
  _buildEvent(BuildContext context, DocumentSnapshot ds)
  {
    return GestureDetector(
      onTap: ()
      {
        //TODO make hero animation to event page
        showDialog(context: context,
          child: SimpleDialog(
            title: Text(ds["name"]),
            children: <Widget>
            [
              Padding(
                child: Icon(Icons.info),
                padding: EdgeInsets.symmetric(vertical: 50),
              ),
              SimpleDialogOption(
                onPressed: ()
                {
                  Navigator.pop(context);
                },
                child: Icon(Icons.cancel),
              ),
            ],
          ),
          barrierDismissible: true,
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[

            // Name and date-time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(ds["name"]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Text(displayDateTime(ds["time"].toDate().toLocal(), false),),
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).accentColor,
            ),

            // Description
            Text(ds["description"]),

            // People
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  //TODO put into function that returns List<Widget>
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CircleAvatar(child: Text("People", textScaleFactor: 0.5,),),
                  )
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).accentColor,
            ),

            //Type
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Chip(label: Text(ds["type"].toLowerCase()),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _readData() async
  {
    await Firestore.instance.collection('events').document('type').get().then((DocumentSnapshot ds)
    {
      for (int i = 0; i < ds['types'].length; i++)
        {
          String name = (List.from(ds['types'])[i]['Name']);
          IconData icon = (MdiIcons.fromString(List.from(ds['types'])[i]['Icon']));
          _types.add(new EventType(name: name, icon: Icon(icon)));
        }
    });
    
    _dataRecieved = true;
  }
}
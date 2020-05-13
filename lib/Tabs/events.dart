import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventType
{
  String name;
  Icon icon;

  EventType({
    this.name,
    this.icon,
  });
}

class EventsTab extends StatefulWidget
{
  @override
  _EventsTabState createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab>
{
  List<EventType> types = [EventType(name: "Worship", icon: Icon(Icons.music_note)), EventType(name: "Worship", icon: Icon(Icons.music_note)), EventType(name: "Worship", icon: Icon(Icons.music_note)), EventType(name: "Worship", icon: Icon(Icons.music_note)), EventType(name: "Worship", icon: Icon(Icons.music_note)), EventType(name: "Worship", icon: Icon(Icons.music_note)), EventType(name: "Worship", icon: Icon(Icons.music_note)), EventType(name: "Worship", icon: Icon(Icons.music_note)),];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => _buildRow(context, index),
        childCount: 1,
      ),
    );
  }

  Widget _buildRow(BuildContext context, int index)
  {
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
  }

  _buildTypeChips(BuildContext context)
  {
    //TODO make filters and events list
    var filterChips = List<Widget>();

    filterChips.add(SizedBox(width: 15,));

    for(EventType type in types)
    {
      Color color = Theme.of(context).buttonColor;

      filterChips.add(
          GestureDetector(
            onTap: ()
            {
              setState(() {
                color = Colors.red[700];
                //TODO activate filter
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(2),
                    ),
                    type.icon,
                    Text(type.name),
                  ],
                ),
                radius: 35,
                backgroundColor: color,
                foregroundColor: Theme.of(context).primaryTextTheme.button.color,
              ),
            ),
          )
      );
    }
    return filterChips;
  }
}
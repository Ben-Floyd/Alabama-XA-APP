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
        childCount: 5,
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
    else
    {
      return _buildEvent(context, "Event Name", "Description of event.", EventType());
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

  //TODO create object people
  //TODO add DateTime to params
  //TODO add list of people to params
  _buildEvent(BuildContext context, String name, String description, EventType type/*, DateTime dateTime, List<String> people*/)
  {
    return GestureDetector(
      onTap: ()
      {
        //TODO make hero animation to event page
        showDialog(context: context,
          child: SimpleDialog(
            title: Text(name),
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
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(name),
                )
              ],
            ),
            Divider(
              color: Theme.of(context).accentColor,
            ),

            // Description
            Text(
              description
            ),

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
                  Chip(label: Text("type"),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DGroup
{
  String name;
  int dayOfWeek;
  TimeOfDay time;

  DGroup({
   this.name,
   this.dayOfWeek,
   this.time,
  });
}

class DGroupTab extends StatefulWidget
{
  @override
  _DGroupTabState createState() => _DGroupTabState();
}

class _DGroupTabState extends State<DGroupTab>
{
  List<DGroup> _yourDGroups = [/*DGroup(), DGroup()*/];
  List<DGroup> _otherDGroups = [DGroup(), DGroup(), DGroup(), DGroup(), DGroup()];
  List<int> filter = [];

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) => _buildRow(context, index),
        childCount: _yourDGroups.length + _otherDGroups.length + 2,
      ),
    );
  }

  Widget _buildRow(BuildContext context, int index)
  {
    if (index == 0)
    {
      return Column(
        children: <Widget>
        [
          SizedBox(height: 16.0),
          Text(
            "Your D-Group",
            style: GoogleFonts.nunito(textStyle: Theme.of(context).primaryTextTheme.headline1),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14.0),
          Container(
            width: 200.0,
            height: 2.0,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: 25.0),
        ],
      );
    }

    if (index == _yourDGroups.length + 1)
    {
      if (_yourDGroups.length < 1)
      {
        return Column(
          children: <Widget>
          [
            SizedBox(height: 25,),
            Text(
              "You are not in a D-Group",
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            Text('Add a D-Group below by tapping on it.'),
            SizedBox(height: 15,),
            _buildDGroupSearch(context),
          ],
        );
      }

      return _buildDGroupSearch(context);
    }

    return _buildDgroup(context);
  }

  _buildDgroup(BuildContext context)
  {
    return GestureDetector(
      onTap: ()
      {
        showDialog(context: context,
          child: SimpleDialog(
            title: Text('D-group Name'),
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
      child: Card (
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 4.0/1.0,
              child: Row(
                children: <Widget>
                [
                  Icon(Icons.image, size: 75,),
                  Text("D-Group Name"),
                  SizedBox(width: 10,),
                  Column(
                    children: <Widget>
                    [
                      Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 10),
                        child: Row(
                          children: <Widget>
                          [
                            CircleAvatar(
                              child: Text('M', style: Theme.of(context).primaryTextTheme.headline2,),
                              backgroundColor: Theme.of(context).accentColor.withAlpha(125),
                              radius: 12,
                            ),
                            SizedBox(
                              width: 5,
                              height: 0,
                            ),
                            CircleAvatar(
                              child: Text('T', style: Theme.of(context).primaryTextTheme.headline2,),
                              backgroundColor: Theme.of(context).accentColor.withAlpha(255),
                              radius: 12,
                            ),
                            SizedBox(
                              width: 5,
                              height: 0,
                            ),
                            CircleAvatar(
                              child: Text('W', style: Theme.of(context).primaryTextTheme.headline2,),
                              backgroundColor: Theme.of(context).accentColor.withAlpha(125),
                              radius: 12,
                            ),
                            SizedBox(
                              width: 5,
                              height: 0,
                            ),
                            CircleAvatar(
                              child: Text('T', style: Theme.of(context).primaryTextTheme.headline2,),
                              backgroundColor: Theme.of(context).accentColor.withAlpha(125),
                              radius: 12,
                            ),
                            SizedBox(
                              width: 5,
                              height: 0,
                            ),
                            CircleAvatar(
                              child: Text('F', style: Theme.of(context).primaryTextTheme.headline2,),
                              backgroundColor: Theme.of(context).accentColor.withAlpha(125),
                              radius: 12,
                            ),
                          ],
                        ),
                      ),
                      Text('TI:ME', style: Theme.of(context).primaryTextTheme.caption),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDGroupSearch(BuildContext context)
  {
    return Column(
      children: <Widget>
      [
        SizedBox(height: 25,),
        Container(
          width:300,
          height: 2,
          color: Theme.of(context).accentColor,
        ),
        SizedBox(height: 25,),
        Text(
          "D-Groups",
          style: GoogleFonts.nunito(textStyle: Theme.of(context).primaryTextTheme.headline1),
          textAlign: TextAlign.center,
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Row(
            children: <Widget>
            [
              SizedBox(width: 25,),
              Flexible(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    //filled: true,
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                  /*onSubmitted: ()
                    {
                      //TODO implement search
                    },*/
                ),
              ),
              SizedBox(width: 10,),
              IconButton(
                icon: Icon(Icons.cancel),
                color: Theme.of(context).primaryIconTheme.color,
                onPressed: ()
                {
                  _searchController.clear();
                  FocusScope.of(context).requestFocus(new FocusNode());

                  //TODO clear search
                },
              ),
              PopupMenuButton<int>(
                icon: Icon(
                  Icons.tune,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>
                [
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text('Monday'),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text('Tuesday'),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Text('Wednesday'),
                  ),
                  PopupMenuItem<int>(
                    value: 4,
                    child: Text('Thursday'),
                  ),
                  PopupMenuItem<int>(
                    value: 5,
                    child: Text('Friday'),
                  ),
                ],
                onSelected: (int value)
                {
                  setState(() {
                    if (filter.contains(value))
                    {
                      filter.remove(value);
                    }
                    else
                    {
                      filter.add(value);
                      filter.sort();
                    }
                  });
                },
              ),
            ],
          ),
        ),
        Row(
          children: _buildFilterChips(context, filter),
        ),
      ],
    );
  }

  _buildFilterChips(BuildContext context, List<int> filter)
  {
    var filterChips = List<Widget>();

    filterChips.add(SizedBox(width: 15,));

    for(int day in filter)
    {
      String txt;
      switch (day)
      {
        case 1:
          txt = 'Mo';
          break;
        case 2:
          txt = 'Tu';
          break;
        case 3:
          txt = 'We';
          break;
        case 4:
          txt = 'Th';
          break;
        case 5:
          txt = 'Fr';
          break;
        default:
          txt = '';
      }
      filterChips.add(
        GestureDetector(
          onTap: ()
          {
            setState(() {
              filter.remove(day);
            });
          },
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Chip(
              label: Text(txt),
            ),
          ),
        )
      );
    }
    return filterChips;
  }
}
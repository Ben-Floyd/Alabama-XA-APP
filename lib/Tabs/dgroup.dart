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
            "Your D-Groups",
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
            ),
            SizedBox(height: 14,),
            RaisedButton(
              onPressed: ()
              {
                //TODO add dgroup
              },
              child: Text('Find a D-Group'),
              color: Theme.of(context).accentColor,
            ),
            SizedBox(height: 14,),
            Container(
            width:200,
            height: 2,
            color: Theme.of(context).accentColor,
            ),
          ],
        );
      }

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
                )
              ],
            ),
          )
        ],
      );
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
}
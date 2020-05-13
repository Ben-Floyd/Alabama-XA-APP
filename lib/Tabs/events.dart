import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsTab extends StatefulWidget
{
  @override
  _EventsTabState createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab>
{
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
        return Row(
          children: _buildTypeChips(context),
        );
      }
  }

  _buildTypeChips(BuildContext context)
  {
    var filter = List<int>();
    filter.add(1);
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
                //filter.remove(day);
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
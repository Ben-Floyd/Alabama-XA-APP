import 'package:flutter/material.dart';

String displayDateTime(DateTime time, bool is24hr)
{
  //print("\n\n\n\n" + time.toString() + "\n\n\n\n");
  String output = "";

  switch(time.weekday)
  {
    case 1:
      output += "Mon, ";
      break;
    case 2:
      output += "Tue, ";
      break;
    case 3:
      output += "Wed, ";
      break;
    case 4:
      output += "Thu, ";
      break;
    case 5:
      output += "Fri, ";
      break;
    case 6:
      output += "Sat, ";
      break;
    case 7:
      output += "Sun, ";
      break;
    default:
  }

  switch(time.month)
  {
    case 1:
      output += "Jan ";
      break;
    case 2:
      output += "Feb ";
      break;
    case 3:
      output += "Mar ";
      break;
    case 4:
      output += "Apr ";
      break;
    case 5:
      output += "May ";
      break;
    case 6:
      output += "Jun ";
      break;
    case 7:
      output += "Jul ";
      break;
    case 8:
      output += "Aug ";
      break;
    case 9:
      output += "Sep ";
      break;
    case 10:
      output += "Oct ";
      break;
    case 11:
      output += "Nov ";
      break;
    case 12:
      output += "Dec ";
      break;
    default:
  }

  output += time.day.toString() + ", ";

  if (is24hr)
  {
    output += time.hour.toString() + ":";
  }
  else
  {
    int hour = time.hour % 12;

    if (time.hour == 12)
      hour = 12;

    if (hour < 10)
    {
      output += "0" + hour.toString() + ":";
    }
    else
    {
      output += hour.toString() + ":";
    }
  }

  if (time.minute < 10)
  {
    output += "0" + time.minute.toString();
  }
  else
  {
    output += time.minute.toString();
  }

  if (!is24hr)
  {
    if(time.hour >= 12)
    {
      output += " PM";
    }
    else
    {
      output += " AM";
    }
  }

  return output;
}
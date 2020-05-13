import 'package:flutter/material.dart';

import 'app.dart';

AppBar generateAppBar(BuildContext context, String title)
{
  return AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: Theme.of(context).primaryIconTheme.color,
      ),
      iconSize: 40,
      tooltip: 'Menu',
      onPressed: ()
      {
        Navigator.pushNamed(context, '/menu', arguments: MenuArguments(title, null));
      },
    ),
    centerTitle: true,
    title: Text(title),
    actions: <Widget>
    [
      IconButton(
        icon: Icon(
          Icons.account_circle,
          color: user != null ? Theme.of(context).accentColor : Theme.of(context).primaryIconTheme.color,
        ),
        iconSize: 40,
        tooltip: 'Profile',
        onPressed: ()
        {
          if (user != null)
          {
            Navigator.pushNamed(context, '/user');
          }
          else
          {
            _login(context);
          }
        },
      ),
    ],
  );
}

_login(BuildContext context) async
{
  final result = await Navigator.pushNamed(context, '/login');

  if (result != 'Cancel' && result != null)
  {
    if (result == 'Failed')
    {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text('Login Unsuccessful'),
          duration: Duration(seconds: 2),
        ));
    }
    else
    {
      user = result;
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text("Loged in as " + user.getName()),
          duration: Duration(seconds: 2),
        ));
    }
  }
}

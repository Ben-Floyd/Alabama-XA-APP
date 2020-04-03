import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget
{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('res/xa_alabama_logo_transparent.png'),
              ]
            ),
            SizedBox(height: 120.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  textColor: Colors.black87,
                  onPressed: ()
                  {
                    // Checks Keyboard Visibility
                    if (MediaQuery.of(context).viewInsets.bottom != 0)
                    {
                      _usernameController.clear();
                      _passwordController.clear();

                      // Removes Focus from Text Field
                      FocusScope.of(context).requestFocus(new FocusNode());
                    }
                    else
                    {
                      Navigator.pop(context);
                    }
                  },
                ),
                RaisedButton(
                  child: Text('LOGIN'),
                  color: Colors.redAccent[700],
                  onPressed: ()
                  {
                    //TODO login and display snack
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user.dart';

class LoginPage extends StatefulWidget
{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _errorMessage = "";

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
                Image.asset("res/xa_alabama_logo_transparent.png"),
              ]
            ),
            SizedBox(height: 120.0),
            Text(_errorMessage, style: Theme.of(context).primaryTextTheme.overline,),
            SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Email",
              ),
              obscureText: false,
            ),
            SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Password",
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text("CANCEL"),
                  textColor: Theme.of(context).primaryTextTheme.button.color,
                  onPressed: ()
                  {
                    // Checks Keyboard Visibility
                    if (MediaQuery.of(context).viewInsets.bottom != 0)
                    {
                      _emailController.clear();
                      _passwordController.clear();

                      // Removes Focus from Text Field
                      FocusScope.of(context).requestFocus(new FocusNode());
                    }
                    else
                    {
                      Navigator.pop(context, "Cancel");
                    }
                  },
                ),
                RaisedButton(
                  child: Text("LOGIN"),
                  color: Theme.of(context).accentColor,
                  onPressed: ()
                  {
                    _login();
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text("Create Account"),
                textColor: Theme.of(context).textSelectionColor,
              onPressed: ()
              {
                Navigator.pushNamed(context, "/createAccount");
              },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text("Forgot Password"),
                textColor: Theme.of(context).textSelectionColor,
              ),
            ),
          ],
        ),
      )
    );
  }

  Future<bool> _login() async
  {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty)
    {
      AuthResult result = null;
      try {
        result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      }
      catch(e)
      {
        setState(() {
          _errorMessage = "Incorrect Email and/or Password";
          print("\n\n\n\n" + e.toString() + "\n\n\n\n" + _emailController.text + "\n" + _passwordController.text + "\n\n\n\n");
        });
      }

      if (result.user != null)
      {
        Navigator.pop(context, new User(user: result.user));
      }
      else
      {
        setState(() {
          _errorMessage = "Incorrect Email and/or Password";
          print("\n\n\n\n null \n\n\n\n");
        });
      }
    }
    else
    {
      setState(()
      {
        _errorMessage = "Incorrect Email and/or Password";
      });
    }
  }
}
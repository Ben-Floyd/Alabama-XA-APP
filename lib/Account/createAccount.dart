import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAccountPage extends StatefulWidget
{
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

enum GradeYear { freshman, sophomore, junior, senior, graduate }

class _CreateAccountPageState extends State<CreateAccountPage>
{
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  GradeYear _gradeYear = GradeYear.freshman;
  String _gender = "Gender";

  double _spacing = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).textTheme.button.color,),
          onPressed: ()
          {
            Navigator.pop(context);
          },
        ),
        title: Text('Create Account', style: TextStyle(color: Theme.of(context).textTheme.button.color),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(
              height: _spacing,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                filled: true,
                labelText: "First Name",
              ),
              obscureText: false,
            ),
            SizedBox(
              height: _spacing,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Email",
              ),
              obscureText: false,
            ),
            SizedBox(
              height: _spacing,
            ),
            TextField(
              controller: _confirmEmailController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Confirm Email",
              ),
              obscureText: false,
            ),
            SizedBox(
              height: _spacing,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Password",
              ),
              obscureText: true,
            ),
            SizedBox(
              height: _spacing,
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Confirm Password",
              ),
              obscureText: true,
            ),
            SizedBox(
              height: _spacing,
            ),
            DropdownButton<String>(
              value: _gender,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (String newValue)
              {
                setState(() {
                  _gender = newValue;
                });
              },
              items: <String>['Gender', 'Male', 'Female'].map<DropdownMenuItem<String>>((String value)
              {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: _spacing,
            ),
            Text("Class"),
            Divider(),
            ListTile(
              title: const Text("Freshman"),
              leading: Radio(
                value: GradeYear.freshman,
                groupValue: _gradeYear,
                onChanged: (GradeYear value)
                {
                  setState(()
                  {
                    _gradeYear = value;
                  });
                }
              ),
            ),
            ListTile(
              title: const Text("Sophomore"),
              leading: Radio(
                  value: GradeYear.sophomore,
                  groupValue: _gradeYear,
                  onChanged: (GradeYear value)
                  {
                    setState(()
                    {
                      _gradeYear = value;
                    });
                  }
              ),
            ),
            ListTile(
              title: const Text("Junior"),
              leading: Radio(
                  value: GradeYear.junior,
                  groupValue: _gradeYear,
                  onChanged: (GradeYear value)
                  {
                    setState(()
                    {
                      _gradeYear = value;
                    });
                  }
              ),
            ),
            ListTile(
              title: const Text("Senior"),
              leading: Radio(
                  value: GradeYear.senior,
                  groupValue: _gradeYear,
                  onChanged: (GradeYear value)
                  {
                    setState(()
                    {
                      _gradeYear = value;
                    });
                  }
              ),
            ),
            ListTile(
              title: const Text("Graduate"),
              leading: Radio(
                  value: GradeYear.graduate,
                  groupValue: _gradeYear,
                  onChanged: (GradeYear value)
                  {
                    setState(()
                    {
                      _gradeYear = value;
                    });
                  }
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text("CANCEL"),
                  textColor: Theme.of(context).primaryTextTheme.button.color,
                  onPressed: ()
                  {
                      Navigator.pop(context);
                  },
                ),
                RaisedButton(
                  child: Text("Create Account"),
                  color: Theme.of(context).accentColor,
                  onPressed: ()
                  {
                    //TODO Create Account
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
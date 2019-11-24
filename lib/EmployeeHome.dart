import 'package:flutter/material.dart';
import 'package:mcglynns_food2go/EmployeeAccount.dart';
import 'package:mcglynns_food2go/Orders.dart';
import 'package:mcglynns_food2go/employeemenu/EmployeeMenuHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mcglynns_food2go/User.dart';

class EmployeeHomePage extends StatefulWidget {
  EmployeeHomePage({Key key, this.title, this.uid}) : super(key: key);

  final String title;
  final String uid;

  @override
  _EmployeeHomePageState createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.red,
          title: new Text('McGlynns Food2Go')
      ),
      body: Center(
          child: new Text('Welcome to Employee Mode!')
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new ListTile(
                title: new Text('Edit User Accounts'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new EmployeeAccount()
                  )
                  );
                }
            ),
            new ListTile(
                title: new Text('Edit Menu'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new EmployeeMenuHome()
                  )
                  );
                }
            ),
            new ListTile(
                title: new Text('View Orders'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new Orders()
                  )
                  );
                }
            ),
            new ListTile(
              title: new Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              }
            )
          ],
        ),
      ),
    );
  }
}

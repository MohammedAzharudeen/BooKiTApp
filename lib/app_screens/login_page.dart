import 'package:bookit/services/auth.dart';
import 'package:bookit/services/authserv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookit/app_screens/root_page.dart';
import 'package:bookit/app_screens/root_page2.dart';
import 'package:bookit/app_screens/sevicer_login.dart';
class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Colors.lightBlueAccent,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              textColor: Colors.white,
              color: Colors.orange,
              child: Text('User',style: new TextStyle(
                fontSize: 26,
              ),),
              padding: EdgeInsets.fromLTRB(110, 12, 110, 12),
              onPressed: (){
                navigateToSubPage(context);
              },
            ),
            const Divider(
              height: 10.0,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.orange,
              child: Text('Servicer',style: new TextStyle(
                fontSize: 26,
              ),),
              padding: EdgeInsets.fromLTRB(90, 12, 90,12),
              onPressed: (){
                navigateToServicer(context);
              },
            ),
          ],
        ),
      )
    );
  }
  Future
  navigateToSubPage(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>RootPage(auth: new Auth())));
  }
  navigateToServicer(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>RootPage2(auth: new Authe())));
  }

}
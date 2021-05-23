import 'package:flutter/material.dart';
import 'package:bookit/services/auth.dart';
import 'package:bookit/app_screens/electricians.dart';
import 'package:bookit/app_screens/machanic.dart';
import 'package:bookit/app_screens/plumbers.dart';
import 'package:bookit/app_screens/painter.dart';
import 'package:bookit/app_screens/carpenters.dart';
import 'package:bookit/app_screens/catering.dart';
import 'package:bookit/app_screens/laundering.dart';
class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {

    void _signOut() async {
      try {
        await auth.signOut();
        onSignOut();
      } catch (e) {
        print(e);
      }

    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Service Provided'),
          actions: <Widget>[
            new FlatButton(
                onPressed: _signOut,
                child: new Text('Logout', style: new TextStyle(fontSize: 17.0, color: Colors.black))
            )
          ],
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                textColor: Colors.white,
                color: Colors.orange,
                child: Text('Electrical'),
                padding: EdgeInsets.fromLTRB(130, 16, 130, 16),
                onPressed: (){
                  navigateToElectricalserv(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.orange,
                child: Text('Plumbing'),
                padding: EdgeInsets.fromLTRB(130, 16, 130, 16),
                onPressed: (){
                  navigateToPlumbingserv(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.orange,
                child: Text('Mechanic'),
                padding: EdgeInsets.fromLTRB(130, 16, 130, 16),
                onPressed: (){
                  navigateToMechanicserv(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.orange,
                child: Text('Painting'),
                padding: EdgeInsets.fromLTRB(135, 16, 135, 16),
                onPressed: (){
                  navigateToPaintingserv(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.orange,
                child: Text('Carpentering'),
                padding: EdgeInsets.fromLTRB(120, 16, 120, 16),
                onPressed: (){
                  navigateToCarpenterserv(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.orange,
                child: Text('Catering'),
                padding: EdgeInsets.fromLTRB(135, 16, 135, 16),
                onPressed: (){
                  navigateToCateringserv(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.orange,
                child: Text('Laundry'),
                padding: EdgeInsets.fromLTRB(136, 16, 136, 16),
                onPressed: (){
                  navigateToLaunderingserv(context);
                },
              ),
            ],
          ),
        )
    );
  }
  Future
  navigateToElectricalserv(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>Electricians()));
  }
  navigateToPlumbingserv(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>Plumbers()));
  }
  navigateToMechanicserv(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>Mechanics()));
  }
  navigateToPaintingserv(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>Painters()));
  }
  navigateToCarpenterserv(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>Carpenters()));
  }
  navigateToCateringserv(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>Catering()));
  }
  navigateToLaunderingserv(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>Laundering()));
  }

}
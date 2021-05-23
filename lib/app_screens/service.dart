import 'package:flutter/material.dart';
import 'package:bookit/app_screens/electricians.dart';
import 'package:bookit/app_screens/plumbers.dart';
class Service_provided extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Service Provided'),
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
                padding: EdgeInsets.fromLTRB(130, 15, 130, 15),
                onPressed: (){
                  navigateToElectrical(context);
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.orange,
                child: Text('Plumbing'),
                padding: EdgeInsets.fromLTRB(130, 15, 130, 15),
                onPressed: (){
                  navigateToPlumbing(context);
                },
              ),
            ],
          ),
        )
    );
  }
  Future
  navigateToElectrical(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>Electricians()));
  }
  navigateToPlumbing(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>Plumbers()));
  }

}
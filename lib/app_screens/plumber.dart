import 'package:flutter/material.dart';
import 'package:bookit/app_screens/final.dart';
class Plumber extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Enter your Details'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.save), onPressed: () {
            navigateToMsg(context);
          },),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.phone),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Phone",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.email),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          const Divider(
            height: 1.0,
          ),
        ],
      ),
    );
  }
  Future
  navigateToMsg(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>finalPage()));
  }
}
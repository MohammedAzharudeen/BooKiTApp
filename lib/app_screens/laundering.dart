import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bookit/services/auth.dart';

class Laundering extends StatelessWidget {
  Laundering({this.auth, this.onSignOut});

  final BaseAuth auth;
  final VoidCallback onSignOut;

  List<String> events = [
    "Launderer1",
    "Launderer2",
    "Launderer3",
    "Launderer4",
    "Launderer5",
    "Launderer6",
  ];

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
        title: Text('Launderers'),
        actions: <Widget>[
          new FlatButton(
              onPressed: _signOut,
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.black))
          )
        ],
        backgroundColor: Colors.lightBlueAccent,
      ), body: Container(
      child: GridView(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        children: events.map((title) {
          return GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(20.0),
              child: getCardByTitle(title),
            ),
            onTap: () {
              //Show Toast
              Fluttertoast.showToast(
                  msg: title + " click",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            },);
        }).toList(),
      ),
    ),);
  }

  Column getCardByTitle(String title) {
    String img = "";
    if (title == "Launderer1")
      img = "assets/icon.png";
    else if (title == "Launderer2")
      img = "assets/icon.png";
    else if (title == "Launderer3")
      img = "assets/icon.png";
    else if (title == "Launderer4")
      img = "assets/icon.png";
    else if (title == "Launderer5")
      img = "assets/icon.png";
    else
      img = "assets/icon.png";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
              child: new Stack(children: <Widget>[
                new Image.asset(img, width: 80.0, height: 80.0,)
              ],
              )),
        ), Text(title, style:
        TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

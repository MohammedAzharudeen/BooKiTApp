import 'package:flutter/material.dart';
import 'package:bookit/services/authserv.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage2 extends StatelessWidget {
  List<String> events= [
    "User1",
    "User2",
    "User3",
    "User4",
    "User5",
    "User6",
  ];
  HomePage2({this.auth, this.onSignOut});
  final BaseAuthe auth;
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
        title: Text('Work Available'),
        actions: <Widget>[
          new FlatButton(
              onPressed: _signOut,
              child: new Text('Logout', style: new TextStyle(fontSize: 17.0, color: Colors.black))
          )
        ],
        backgroundColor: Colors.lightBlueAccent,
      ),body: Container(
      child: GridView(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: events.map((title) {
          return GestureDetector(
            child: Card(
              margin:  const EdgeInsets.all(20.0),
              child: getCardByTitle(title),
            ),
            onTap: (){
              //Show Toast
              Fluttertoast.showToast(
                  msg:title+" click",
                  toastLength:Toast.LENGTH_SHORT,
                  gravity:ToastGravity.CENTER,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize:16.0
              );
            },);
        }).toList(),
      ),
    ),);
  }

  Column getCardByTitle(String title) {

    String img= "";
    if(title == "User1")
      img="assets/icon.png";
    else if(title == "User2")
      img="assets/icon.png";
    else if(title == "User3")
      img="assets/icon.png";
    else if(title == "User4")
      img="assets/icon.png";
    else if(title == "User5")
      img="assets/icon.png";
    else
      img="assets/icon.png";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
              child: new Stack(children: <Widget>[
                new Image.asset(img,width: 80.0,height: 80.0,)
              ],
              )),
        ),Text(title,style:
        TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
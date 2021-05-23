import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bookit/services/auth.dart';
import 'package:bookit/servicers/e1_details.dart';
import 'package:bookit/servicers/e2_details.dart';
import 'package:bookit/servicers/e3_details.dart';
import 'package:bookit/servicers/e4_details.dart';
import 'package:bookit/servicers/e5_details.dart';
import 'package:bookit/servicers/e6_details.dart';
class Electricians extends StatelessWidget {
  Electricians({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;

  List<String> events= [
    "Kumar",
    "Ganesh",
    "Suresh",
    "Rajesh",
    "Immanuel",
    "Khaliq",
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
          title: Text('Electricians'),
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
                  if(title == 'Kumar')
                    navigateToE1details(context);
                  else if(title == 'Ganesh')
                    navigateToE2details(context);
                  else if(title == 'Suresh')
                    navigateToE3details(context);
                  else if(title == 'Rajesh')
                    navigateToE4details(context);
                  else if(title == 'Immanuel')
                    navigateToE5details(context);
                  else
                    navigateToE6details(context);
                //Show Toast
                /*Fluttertoast.showToast(
                msg:title+" click",
                toastLength:Toast.LENGTH_SHORT,
                gravity:ToastGravity.CENTER,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize:16.0
                );*/
    },);
    }).toList(),
    ),
    ),);
  }

  Column getCardByTitle(String title) {

    String img= "";
    if(title == "Kumar")
        img="assets/icon.png";
    else if(title == "Ganesh")
        img="assets/icon.png";
    else if(title == "Suresh")
      img="assets/icon.png";
    else if(title == "Rajesh")
      img="assets/icon.png";
    else if(title == "Immanuel")
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
  Future
  navigateToE1details(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>E1detailes()));
  }
  Future
  navigateToE2details(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>E2details()));
  }
  Future
  navigateToE3details(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>E3details()));
  }
  Future
  navigateToE4details(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>E4details()));
  }
  Future
  navigateToE5details(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>E5details()));
  }
  Future
  navigateToE6details(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>E6details()));
  }
}
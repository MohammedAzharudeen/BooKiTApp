import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bookit/app_screens/p1_details.dart';
import 'package:bookit/servicers/p2_details.dart';
import 'package:bookit/servicers/p3_details.dart';
import 'package:bookit/servicers/p4_details.dart';
import 'package:bookit/servicers/p5_details.dart';
import 'package:bookit/servicers/p6_details.dart';
class Plumbers extends StatelessWidget{
  List<String> events= [
    "Das",
    "Raja",
    "Richard",
    "Rakesh",
    "Nagesh",
    "Pranesh",
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text('Plumbers'),
    backgroundColor: Colors.lightBlueAccent
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
      if(title == 'Das')
        navigateToP1details(context);
      else if(title == 'Raja')
        navigateToP2details(context);
      else if(title == 'Richard')
        navigateToP3details(context);
      else if(title == 'Rakesh')
        navigateToP4details(context);
      else if(title == 'Nagesh')
        navigateToP5details(context);
      else
        navigateToP6details(context);
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
    if(title == "Das")
      img="assets/icon.png";
    else if(title == "Raja")
      img="assets/icon.png";
    else if(title == "Richard")
      img="assets/icon.png";
    else if(title == "Rakesh")
      img="assets/icon.png";
    else if(title == "Nagesh")
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
  navigateToP1details(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>P1details()));
  }
  Future
  navigateToP2details(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>P2details()));
  }
  Future
  navigateToP3details(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>P3details()));
  }
  Future
  navigateToP4details(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>P4details()));
  }
  Future
  navigateToP5details(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>P5details()));
  }
  Future
  navigateToP6details(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>P6details()));
  }
}

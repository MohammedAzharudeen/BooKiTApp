import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Painters extends StatelessWidget{
  List<String> events= [
    "Painter1",
    "Painter2",
    "Painter3",
    "Painter4",
    "Painter5",
    "Painter6",
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text('Painters'),
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
    if(title == "Painter1")
      img="assets/icon.png";
    else if(title == "Painter2")
      img="assets/icon.png";
    else if(title == "Painter3")
      img="assets/icon.png";
    else if(title == "Painter4")
      img="assets/icon.png";
    else if(title == "Painter5")
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
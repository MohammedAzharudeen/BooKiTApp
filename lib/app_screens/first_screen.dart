import 'package:bookit/app_screens/login_page.dart';
import 'package:flutter/material.dart';
class First extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amberAccent,

      body: Center(
          child: GestureDetector(
          onTap: () {
            navigateToSubPage(context);
          },
          child: ClipOval(
            child: Container(
             color: Colors.lightBlueAccent,
             height: 160.0, // height of the button
              width: 160.0, // width of the button
             child: Center(child:new Text('BooKiT',style: new TextStyle(
               fontFamily: 'Krona',
               fontWeight: FontWeight.w800,
               fontSize: 40.0,
               color: Colors.white,
             ),
             ),
             ),
          ),
        ),
      )),
            );
  }
  Future
  navigateToSubPage(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>Login()));
  }


}
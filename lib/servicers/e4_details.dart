import 'package:bookit/app_screens/final.dart';
import 'package:flutter/material.dart';

class E4details extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Name: Rajesh",style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 5,
            ),
            Text("Location: Coimbatore",style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 5,
            ),
            Text("Experience: 8 years",style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 5,
            ),
            Text("Rating: 4.6/5",style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 5,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.orange,
              child: Text('Book'),
              padding: EdgeInsets.fromLTRB(100, 12, 100, 12),
              onPressed: (){
                navigateToFinCont(context);
              },
            ),
          ],
        ),
      ),
    );
  }
  Future
  navigateToFinCont(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>finalPage()));
  }

}
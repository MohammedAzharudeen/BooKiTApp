import 'package:flutter/material.dart';
class finalPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Center(
        child: Text(' Thank You. BookiT will contact you.',style: TextStyle(
        fontFamily: 'Krona',
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.lightBlueAccent,
      ),
      ),
      ),
      )
    );
  }

}
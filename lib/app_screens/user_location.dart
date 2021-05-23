import 'package:flutter/material.dart';
import 'package:bookit/app_screens/service.dart';
import 'package:bookit/services/auth.dart';
class DropDown extends StatefulWidget {
  DropDown() : super();

  final String title = "DropDown Demo";

  @override
  DropDownState createState() => DropDownState();
}

class Location {
  int id;
  String name;

  Location(this.id, this.name);

  static List<Location> getCompanies() {
    return <Location>[
      Location(1, 'Coimbatore'),
      Location(2, 'Pollachi'),
      Location(3, 'Madurai'),
      Location(4, 'Chennai'),
      Location(5, 'Salem'),
    ];
  }
}

class DropDownState extends State<DropDown> {
  DropDownState({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;
  //
  List<Location> _companies = Location.getCompanies();
  List<DropdownMenuItem<Location>> _dropdownMenuItems;
  Location _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Location>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Location>> items = List();
    for (Location company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Location selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

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
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Select the user Location"),
        ),
        body: new Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Select a location",style: new TextStyle(
                  fontSize: 30.0,
                ),),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButton(
                  value: _selectedCompany,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.orange,
                  child: Text('Ok',style: new TextStyle(
                    fontSize: 26.0,
                  ),),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  onPressed: (){
                    navigateToService(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future
  navigateToService(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>Service_provided()));
  }
}
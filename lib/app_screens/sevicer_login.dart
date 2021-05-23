/*import 'package:bookit/app_screens/serv_loc.dart';
import 'package:flutter/material.dart';
import 'package:bookit/app_screens/servicer_location.dart';
import 'package:bookit/app_screens/work.dart';
class ServicerLogin extends StatefulWidget {
  ServicerLogin({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<ServicerLogin> {
  TextStyle style = TextStyle(fontFamily: 'Krona', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
    );
    final logiButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          navigateToServLoc(context);
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          navigateToServicerLocation(context);
        },
        child: Text("New Servicer",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Servicer'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                logiButton,
                SizedBox(
                  height: 15.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future
  navigateToServicerLocation(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DropDownd()));
  }
  Future
  navigateToServLoc(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ServLoc()));
  }

}*/
import 'package:flutter/material.dart';
import 'package:bookit/app_screens/primary_button.dart';
import 'package:bookit/services/authserv.dart';

class LoginPage2 extends StatefulWidget {
  LoginPage2({Key key, this.title, this.auth, this.onSignIn}) : super(key: key);

  final String title;
  final BaseAuthe auth;
  final VoidCallback onSignIn;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

enum FormType {
  login,
  register
}

class _LoginPageState extends State<LoginPage2> {
  static final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;
  String _authHint = '';

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        String ServicerId = _formType == FormType.login
            ? await widget.auth.signIn(_email, _password)
            : await widget.auth.createServicer(_email, _password);
        setState(() {
          _authHint = 'Signed In\n\nServicer id: $ServicerId';
        });
        widget.onSignIn();
      }
      catch (e) {
        setState(() {
          _authHint = 'Sign In Error\n\n${e.toString()}';
        });
        print(e);
      }
    } else {
      setState(() {
        _authHint = '';
      });
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
      _authHint = '';
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
      _authHint = '';
    });
  }

  List<Widget> usernameAndPassword() {
    return [
      padded2(child: new TextFormField(
        key: new Key('email'),
        decoration: new InputDecoration(labelText: 'Email'),
        autocorrect: false,
        validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
        onSaved: (val) => _email = val,
      )),
      padded2(child: new TextFormField(
        key: new Key('password'),
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        autocorrect: false,
        validator: (val) => val.isEmpty ? 'Password can\'t be empty.' : null,
        onSaved: (val) => _password = val,
      )),
    ];
  }

  List<Widget> submitWidgets() {
    switch (_formType) {
      case FormType.login:
        return [
          new PrimaryButton(
              key: new Key('login'),
              text: 'Login',
              height: 44.0,
              onPressed: validateAndSubmit
          ),
          new FlatButton(
              key: new Key('need-account'),
              child: new Text("Need an account? Register"),
              onPressed: moveToRegister
          )
        ];
      case FormType.register:
        return [
          new PrimaryButton(
              key: new Key('register'),
              text: 'Create an account',
              height: 44.0,
              onPressed: validateAndSubmit
          ),
          new FlatButton(
              key: new Key('need-login'),
              child: new Text("Have an account? Login"),
              onPressed: moveToLogin
          ),
        ];
    }
    return null;
  }

  Widget hintText() {
    return new Container(
      //height: 80.0,
        padding: const EdgeInsets.all(32.0),
        child: new Text(
            _authHint,
            key: new Key('hint'),
            style: new TextStyle(fontSize: 18.0, color: Colors.grey),
            textAlign: TextAlign.center)
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        backgroundColor: Colors.grey[300],
        body: new SingleChildScrollView(child: new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Column(
                children: [
                  new Card(
                      child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Container(
                                padding: const EdgeInsets.all(16.0),
                                child: new Form(
                                    key: formKey,
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: usernameAndPassword() + submitWidgets(),
                                    )
                                )
                            ),
                          ])
                  ),
                  hintText()
                ]
            )
        ))
    );
  }

  Widget padded2({Widget child}) {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }
}

  /*Future
  navigatetoServ(context)
  async{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>Service_pro()));
  }*/
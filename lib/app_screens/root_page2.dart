
import 'package:flutter/material.dart';
import 'package:bookit/services/authserv.dart';
import 'package:bookit/app_screens/userlogin.dart';
import 'package:bookit/app_screens/sevicer_login.dart';
import 'package:bookit/app_screens/home_page2.dart';


class RootPage2 extends StatefulWidget {
  RootPage2({Key key, this.auth}) : super(key: key);
  final BaseAuthe auth;

  @override
  State<StatefulWidget> createState() => new _RootPage2State();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _RootPage2State extends State<RootPage2> {

  AuthStatus authStatus = AuthStatus.notSignedIn;

  initState() {
    super.initState();
    widget.auth.currentServicer().then((userId) {
      setState(() {
        authStatus = userId != null ? AuthStatus.signedIn : AuthStatus.notSignedIn;
      });
    });
  }

  void _updateAuthStatus(AuthStatus status) {
    setState(() {
      authStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new LoginPage2(
          title: 'Servicer Login',
          auth: widget.auth,
          onSignIn: () => _updateAuthStatus(AuthStatus.signedIn),
        );
      case AuthStatus.signedIn:
        return new HomePage2(
            auth: widget.auth,
            onSignOut: () => _updateAuthStatus(AuthStatus.notSignedIn)
        );
    }
  }
}
import 'package:flutter/material.dart';
import 'package:solarsystem/firebase/auth.dart';
import 'package:solarsystem/firebase/authentication.dart';
//import 'package:solarsystem/login_widgets.dart';
import 'package:provider/provider.dart';

class GooglePage extends StatelessWidget {
  const GooglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        children: <Widget>[
         
          // Add from here
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
         
        ],
      ),
    );
  }
}
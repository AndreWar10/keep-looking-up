import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solarsystem/pages/home_page.dart';
import 'package:solarsystem/pages/login_page.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return HomePage();
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Something Wrong'),
          );
        } else {
          return LoginPage();
        }
      },
    ),
  );
}

import 'package:feather_icons/feather_icons.dart';
import 'package:firebaseprofiletutorial/views/profile_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static String route = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FeatherIcons.user),
            onPressed: () {
              Navigator.pushNamed(context, ProfileView.route);
            },
          )
        ],
      ),
    );
  }
}

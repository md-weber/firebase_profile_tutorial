import 'package:feather_icons/feather_icons.dart';
import 'package:firebaseprofiletutorial/locator.dart';
import 'package:firebaseprofiletutorial/repository/auth_repo.dart';
import 'package:flutter/material.dart';

class ExternalSignInButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            locator.get<AuthRepo>().signInWithGoogle();
          },
          child: CircleAvatar(
            child: Icon(
              FeatherIcons.facebook,
              size: 40,
            ),
            radius: 30,
          ),
        ),
        GestureDetector(
          onTap: () {
            locator.get<AuthRepo>().signInWithGoogle();
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              FeatherIcons.activity,
              size: 40,
            ),
            radius: 30,
          ),
        ),
      ],
    );
  }
}

import 'package:firebaseprofiletutorial/locator.dart';
import 'package:firebaseprofiletutorial/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
              FontAwesome5Brands.facebook,
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
              FontAwesome5Brands.google,
              size: 40,
            ),
            radius: 30,
          ),
        ),
      ],
    );
  }
}

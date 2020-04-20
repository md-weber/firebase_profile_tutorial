import 'dart:io';

import 'package:firebaseprofiletutorial/locator.dart';
import 'package:firebaseprofiletutorial/models/user_model.dart';
import 'package:firebaseprofiletutorial/view_controller/user_controller.dart';
import 'package:firebaseprofiletutorial/views/profile/avatar.dart';
import 'package:firebaseprofiletutorial/views/profile/manage_profile_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  static String route = "profile-view";

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  UserModel _currentUser = locator.get<UserController>().currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Avatar(
                    avatarUrl: _currentUser?.avatarUrl,
                    onTap: () async {
                      File image = await ImagePicker.pickImage(
                          source: ImageSource.gallery);

                      await locator
                          .get<UserController>()
                          .uploadProfilePicture(image);

                      setState(() {});
                    },
                  ),
                  Text(
                      "Hi ${_currentUser.displayName ?? 'nice to see you here.'}"),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ManageProfileInformationWidget(
              currentUser: _currentUser,
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseprofiletutorial/locator.dart';
import 'package:firebaseprofiletutorial/models/user_model.dart';
import 'package:firebaseprofiletutorial/repository/auth_repo.dart';

class StorageRepo {
  FirebaseStorage _storage = FirebaseStorage.instance
    ..bucket = "gs://profiletutorial-c5ed1.appspot.com";

  AuthRepo _authRepo = locator.get<AuthRepo>();

  Future<String> uploadFile(File file) async {
    UserModel user = await _authRepo.getUser();
    var userId = user.uid;

    var storageRef = _storage.ref().child("user/profile/$userId");
    TaskSnapshot uploadTaskSnapshot = await storageRef.putFile(file);
    String downloadUrl = await uploadTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> getUserProfileImage(String uid) async {
    return await _storage.ref().child("user/profile/$uid").getDownloadURL();
  }
}

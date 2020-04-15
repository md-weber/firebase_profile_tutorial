import 'package:firebaseprofiletutorial/locator.dart';
import 'package:firebaseprofiletutorial/models/user_model.dart';
import 'package:firebaseprofiletutorial/repository/auth_repo.dart';

class UserController {
  UserModel _currentUser;
  AuthRepo _authRepo = locator.get<AuthRepo>();
  Future init;

  UserController() {
    init = initUser();
  }

  Future<UserModel> initUser() async {
    _currentUser = await _authRepo.getUser();
    return _currentUser;
  }

  UserModel get currentUser => _currentUser;
}

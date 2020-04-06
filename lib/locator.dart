import 'package:firebaseprofiletutorial/view_controller/auth_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<AuthController>(AuthController());
}

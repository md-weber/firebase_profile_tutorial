import 'package:firebaseprofiletutorial/locator.dart';
import 'package:firebaseprofiletutorial/views/home_view.dart';
import 'package:firebaseprofiletutorial/views/login_view.dart';
import 'package:firebaseprofiletutorial/views/profile_view.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFFFF2893),
        accentColor: Color(0xFF000000),
        textTheme: ThemeData.light().textTheme.copyWith(
              button: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            ),
      ),
      routes: {
        HomeView.route: (context) => HomeView(),
        LoginView.route: (context) => LoginView(),
        ProfileView.route: (context) => ProfileView(),
      },
      initialRoute: LoginView.route,
    );
  }
}

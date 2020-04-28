import 'package:firebaseprofiletutorial/locator.dart';
import 'package:firebaseprofiletutorial/view_controller/user_controller.dart';
import 'package:firebaseprofiletutorial/views/home/external_sign_in_buttons.dart';
import 'package:firebaseprofiletutorial/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginView extends StatefulWidget {
  static String route = "login";

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController(text: "test@test.com");
  var passwordController = TextEditingController(text: "123456");

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://source.unsplash.com/random"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0x30000000),
            backgroundBlendMode: BlendMode.darken,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20.0),
                Center(
                  child: CircleAvatar(
                    backgroundColor: const Color(0x00000000),
                    backgroundImage:
                        AssetImage("assets/images/logo.png"),
                    radius: 50.0,
                  ),
                ),
                SizedBox(height: 50.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xBBFFFFFF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration:
                                InputDecoration(hintText: "Email"),
                            controller: emailController,
                          ),
                          TextFormField(
                            keyboardType:
                                TextInputType.visiblePassword,
                            decoration:
                                InputDecoration(hintText: "Password"),
                            controller: passwordController,
                          ),
                          SizedBox(height: 10),
                          RaisedButton.icon(
                            color: Theme.of(context).primaryColor,
                            icon: Icon(
                              Icons.verified_user,
                              color: textTheme.button.color,
                            ),
                            label: Text(
                              "Sign in",
                              style: textTheme.button,
                            ),
                            onPressed: () async {
                              try {
                                await locator
                                    .get<UserController>()
                                    .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password:
                                          passwordController.text,
                                    );
                                Navigator.pushNamed(
                                    context, HomeView.route);
                              } catch (e) {
                                print("Something went wrong!");
                              }
                            },
                          ),
                          RaisedButton.icon(
                            color: Theme.of(context).accentColor,
                            icon: Icon(
                              FontAwesome5Solid.user_plus,
                              color: textTheme.button.color,
                            ),
                            label: Text(
                              "Register",
                              style: textTheme.button,
                            ),
                            onPressed: () {},
                          ),
                          ExternalSignInButtons()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

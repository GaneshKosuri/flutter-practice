import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/home_screen.dart';
import 'package:flutter_auth/Screens/Login/Widgets/body.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String username = "";
  String password = "";
  String errorText = "";
  bool isAPILoading = false;
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    // Create storage

    // Start listening to changes.
    myUsernameController.addListener(_onChangeUsername);
    myPasswordController.addListener(_onChangePassword);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myUsernameController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  void _onChangeUsername() {
    setState(() {
      username = myUsernameController.text;
      errorText = "";
    });
  }

  void setJWTToken(token) async{
    await storage.write(key: 'jwtToken', value: token);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ),
    );
  }

  void _onChangePassword() {
    setState(() {
      password = myPasswordController.text;
      errorText = "";
    });
  }


  Future onClickLogin() async {
    setState(() {
      isAPILoading = true;
    });
    http.post("https://apis.ccbp.in/login",
        body: jsonEncode(<String, String>{
          'username': username,
          "password":password
        }),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      var parsedData = json.decode(res);

      if (statusCode < 200 || statusCode > 400 || json == null) {
        print("Error while fetching data");
      } else if (statusCode == 400) {
        setState(() {
          errorText = parsedData["error_msg"];
        });
      }
      else {
        print(parsedData["jwt_token"]);
        setJWTToken(parsedData["jwt_token"]);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        username: username,
        password: password,
        usernameController:myUsernameController,
        passwordController:myPasswordController,
          errorText:errorText,
          onClickLogin:onClickLogin,
      ),
    );
  }

}
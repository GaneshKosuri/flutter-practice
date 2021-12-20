import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/Widgets/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Widgets/already_have_an_account_acheck.dart';
import 'package:flutter_auth/Widgets/rounded_button.dart';
import 'package:flutter_auth/Widgets/rounded_input_field.dart';
import 'package:flutter_auth/Widgets/rounded_password_field.dart';
import 'package:flutter_auth/Widgets/error_text.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  final username;
  final password;
  final usernameController;
  final passwordController;
  final errorText;
  final onClickLogin;
  const Body({
    Key key,
    this.username,
    this.password,
    this.usernameController,
    this.passwordController,
    this.errorText,
    this.onClickLogin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(
                  fontSize:30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Email",
              inputFieldController: usernameController,
            ),
            RoundedPasswordField(
              hintText: "Password",
              inputFieldController: passwordController,
            ),
            RoundedButton(
              text: "LOGIN",
              press: onClickLogin,
            ),
            SizedBox(height: size.height * 0.03),
            ErrorText(
              textContent:errorText,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

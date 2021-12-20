import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class ErrorText extends StatelessWidget {
  final textContent;
  const ErrorText({
    Key key,
    this.textContent,
   }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
        textContent,
         style: TextStyle(
        fontSize: 15,
         color: lightRed500Color,

         ),
    );
  }

}
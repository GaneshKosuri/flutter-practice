import 'package:flutter/cupertino.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text("Todo List", style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),)
              )
            ]
        )
    );
  }

}
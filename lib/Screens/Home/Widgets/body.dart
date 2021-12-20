import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/TodosList/todos_list.dart';
import 'package:flutter_auth/Widgets/rounded_button.dart';

class Body extends StatelessWidget{
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
            child: Text("Home Screen",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
          ),
          RoundedButton(
            text: "Todo List",
            press: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context){
                    return TodosList();
              }
              ));
            },
          ),
       ]
      )
    );
  }
}
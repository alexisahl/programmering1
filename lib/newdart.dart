import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //Page Widget
    return Scaffold(
      //AppBar
      appBar: AppBar(
        //Text widget
        title: const Text("Padding"),
        //Bar Color
        backgroundColor: Colors.lime,
      ),
      body: Container(//const Padding
        padding: EdgeInsets.fromLTRB(50, 25, 45, 5),
        margin: const EdgeInsets.all(25.0),
        color : Colors.grey[600],
        child: Text("Test Text"),
        ),
    );
  }
}
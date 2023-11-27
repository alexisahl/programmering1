import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("My third app"),
        centerTitle: true,
        backgroundColor: Colors.red[200],
      ),
      body: const Center(
      child: Text("We are doing this again",
      style: TextStyle(fontSize: 20.0,),
      ),
      ),
    );
  }
}

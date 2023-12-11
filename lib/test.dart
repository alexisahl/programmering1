import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        //ElevatedButton, Textbutton, OutlineButton
        child: IconButton(
          onPressed: () {
          print('You Clicked me');
        },
        icon: const Icon(Icons.home),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Color.fromARGB(255, 222, 222, 222),       
          ),
        )
      ),
      );
  }
}
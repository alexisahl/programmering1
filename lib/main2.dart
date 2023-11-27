import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text("Second App"),
      centerTitle: true,
    ),
    body: const Center(
      child: Text("Hello classroom"),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () =>{
        SystemNavigator.pop()
      }, 
      child: const Text('Exit')
    ),
    ),
)
);
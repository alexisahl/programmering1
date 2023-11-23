import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Hello World Demo App",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red
        )
      ),
      home: const MyHomePage(title: "Home Page"),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatelessWidget{
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
    ),
    body: const Center(
      child: Text(
        'Welcome to Flytter'
      )),
    );
  }
}
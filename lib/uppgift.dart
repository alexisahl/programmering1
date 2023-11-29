import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.grey[800],
    appBar: AppBar(
      title: const Text("Doctor's Appointment"),
      centerTitle: true,
      backgroundColor: Colors.orange,
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () =>{
        SystemNavigator.pop()
      }, 
      child: const Text('Exit')
    ),
    
    body:Padding(
      padding: const EdgeInsets.fromLTRB(50, 30, 50, 25),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/jg_diff.jpg'),
                radius: 100,
              )
            ),
            Divider(
              height: 90,
              color: const Color.fromARGB(255, 88, 83, 83),
            ),
            Text('NAME',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
            )
            ),
            SizedBox(height: 10),
            Text('Tarzaned',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                )
            ),
            SizedBox(height: 30),
            Text('Title',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                )
            ),
            SizedBox(height: 10),
            Text('Master of the Jungle',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                )
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text('mrzaned@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1,

                ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text('+222 2222 222',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1,

                ),
                ),
              ],
            )

          ]   
      )
        
    )
  ),
  debugShowCheckedModeBanner: false,
)
);
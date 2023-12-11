import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: EnrCard(),
));
class EnrCard extends StatefulWidget {
  @override
  State<EnrCard> createState() => _EnrCardState();
}

class _EnrCardState extends State<EnrCard> {

  int cardLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('ENR ID Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            cardLevel += 1;
          });
        },
        child:
        Icon(Icons.add,),
        backgroundColor: Colors.grey[800],

      ),
      body:Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/cats2.jpg'),
                radius: 40,
              ),
            ),
            Divider(
              height: 90,
              color: Colors.grey[800],
            ),
            Text('NAME',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            )
            ),
            SizedBox(height: 10),
            Text('Edwin Natanael Romero',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                )
            ),
            SizedBox(height: 30),
            Text('CURRENT LEVEL',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                )
            ),
            SizedBox(height: 10),
            Text('$cardLevel',
                style: TextStyle(
                  color: Colors.amberAccent[200],
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
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10),
                Text('edwromero01@gmail.com',
                style: TextStyle(
                  color: Colors.grey[400],
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
                  Icons.warning,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10),
                Text('This is a small demonstration of my learning in flutter.',

                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    letterSpacing: 1,

                  ),
                ),

              ],
            ),

          ],
        ),
      )
    );
  }
}




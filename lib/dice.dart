import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDiceRoller(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyDiceRoller extends StatefulWidget {
  @override
  _MyDiceRollerState createState() => _MyDiceRollerState();
}

class _MyDiceRollerState extends State<MyDiceRoller> {
  int _randomNumber = 1;
  int _modifier = 0;

  void _rollDice(int sides) {
    setState(() {
      _randomNumber = Random().nextInt(sides) + 1 + _modifier;
    });
  }

  void _incrementModifier() {
    setState(() {
      _modifier++;
    });
  }

void _decrementModifier() {
  setState(() {
    _modifier--;
  });
}

  Widget _buildButton(int sides, String imageAsset) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => _rollDice(sides),
          child: Column(
            children: [
              Image.asset(
                'assets/$imageAsset',
                width: 40,
                height: 40,
              ),
              Text('d$sides'),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Dice Roller', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_randomNumber',
              style: TextStyle(
                fontSize: 100.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(4, 'd4.png'),
                _buildButton(6, 'd6.png'),
                _buildButton(8, 'd8.png'),
                _buildButton(10, 'd10.png'),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(12, 'd12.png'),
                _buildButton(20, 'd20.png'),
                _buildButton(100, 'd100.png'),
                _buildButton(2, 'd2.png'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _decrementModifier(),
                  child: Text('-', style: TextStyle(color: Colors.red)),
                ),
                Text(
                  'Modifier: $_modifier',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _incrementModifier(),
                  child: Text('+', style: TextStyle(color: Colors.green),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


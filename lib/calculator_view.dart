// calculator_view.dart
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
String _input = '';
String _output = '';
String equation = '0';
String result = '0';
String expression = '';
ContextModel cm = ContextModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
        leading: const Icon(Icons.calculate, color: Colors.orange),
        actions: const [
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text('DEG', style: TextStyle(color: Colors.white38)),
            ),
            SizedBox(width: 20),
          ],
        title: const Text('Calculator App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _input,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              _output,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('AC', Colors.white10, () => buttonPressed('AC')),
                _buildNumberButton('%', Colors.white10, () => buttonPressed('%')),
                _buildNumberButton('÷', Colors.white10, () => buttonPressed('÷')),
                _buildNumberButton("×", Colors.white10, () => buttonPressed('×')),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('7', Colors.white24, () => buttonPressed('7')),
                _buildNumberButton('8', Colors.white24, () => buttonPressed('8')),
                _buildNumberButton('9', Colors.white24, () => buttonPressed('9')),
                _buildNumberButton('-', Colors.white10, () => buttonPressed('-')),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('4', Colors.white24, () => buttonPressed('4')),
                _buildNumberButton('5', Colors.white24, () => buttonPressed('5')),
                _buildNumberButton('6', Colors.white24, () => buttonPressed('6')),
                _buildNumberButton('+', Colors.white10, () => buttonPressed('+')),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        _buildNumberButton('1', Colors.white24, () => buttonPressed('1')),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                        _buildNumberButton('2', Colors.white24, () => buttonPressed('2')),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                        _buildNumberButton('3', Colors.white24, () => buttonPressed('3')),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildNumberButton('⌫', Colors.white24, () => buttonPressed('⌫')),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                        _buildNumberButton('0', Colors.white24, () => buttonPressed('0')),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                        _buildNumberButton('.', Colors.white24, () => buttonPressed('.')),
                      ],
                    ),
                  ],
                ),
                _buildNumberButton('=', Colors.orange, () => buttonPressed('=')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(String buttonText, Color buttonColor, void Function()? buttonPressed) {
    return Container(
      width: 75,
      height: buttonText == '=' ? 150 : 70,
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: buttonPressed,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          backgroundColor: buttonColor,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 27, color: Colors.white),
        ),
      ),
    );
  }

  String formatPercentage(double value) {
    return '${(value * 100).toStringAsFixed(2)}%';
  }

buttonPressed(String buttonText) {
  String doesContainDecimal(dynamic result) {
      if (result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if (!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
      }
    return result;
  }

     setState(() {
      if (buttonText == "AC") {
        equation = "0";
        result = "0";
        _input = ''; 
        _output = '';
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation.isEmpty) {
          equation = "0";
        }
        _input = equation;
      } else if (buttonText == "+/-") {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
        _input = equation;
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          if (expression.contains('%')) {
            result = formatPercentage(double.parse(result));
          }

          _input = equation;
          _output = result;
        } catch (e) {
          result = "Error: ${e.toString()}";
          _output = result;
        }
      } else if (buttonText == "%") {
        if (equation.isNotEmpty) {
          try {
            double value = double.parse(equation);
            double percentage = value / 100.0;
            equation = formatPercentage(percentage);
            result = equation;

            _input = equation;
            _output = result;
          } catch (e) {
            print("Error parsing expression: $e");
          }
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }

        _input = equation;
      }
    });
}



}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLoginPage(),
      debugShowCheckedModeBanner: false
    );
  }
}

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    print('Username: $username');
    print('Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: Icon(Icons.lock, ),
        actions: [
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: _login,
              child: Text("Forgot password?")
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Sign In'),
            ),
            Text(
              'Continue with?'
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              IconButton(onPressed: _login, icon: Image.asset('assets/google.png', width: 40, height: 40,)),
              IconButton(onPressed: _login, icon: Image.asset('assets/apple.png', width: 40, height: 40,)),
              IconButton(onPressed: _login, icon: Image.asset('assets/facebook.png', width: 40, height: 40,))
              ],
            ),
            TextButton(
              onPressed: _login,
              child: Text('Not a member? Register')
            )
          ],
        ),
      ),
    );
  }
}

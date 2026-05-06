import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      appBar: AppBar(centerTitle: true, title: const Text('Login')),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.70,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_title(), _loginForm(), _loginButton()],
      ),
    );
  }

  Widget _title() {
    return const Text(
      'Recipe Book',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.90,
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(decoration: InputDecoration(hintText: "Username")),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(hintText: "Password"),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.60,
      child: ElevatedButton(onPressed: () {}, child: const Text('Login')),
    );
  }
}

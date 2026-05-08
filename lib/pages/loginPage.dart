import 'package:flutter/material.dart';
import 'package:recipes_app/services/auth_service.dart';
import 'package:status_alert/status_alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  String? userName, password;

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
        children: [_title(), _loginForm()],
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
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: "emilys",
              onSaved: (value) {
                setState(() {
                  userName = value;
                });
              },
              validator: (userName) {
                if (userName == null || userName.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              decoration: InputDecoration(hintText: "Username"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: "emilyspass",
              onSaved: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              validator: (password) {
                if (password == null || password.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              decoration: InputDecoration(hintText: "Password"),
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.60,
      child: ElevatedButton(
        onPressed: () async {
          if (_loginFormKey.currentState?.validate() ?? false) {
            _loginFormKey.currentState?.save();
            print('LoginPage: userName: $userName, password: $password');
            bool result = await AuthService().login(userName!, password!);

            if (result) {
              Navigator.pushReplacementNamed(context, "/home");
            } else {
              StatusAlert.show(
                context,
                duration: const Duration(seconds: 2),
                title: 'Login Failed',
                subtitle: 'Please try again',
                configuration: const IconConfiguration(icon: Icons.error),
                maxWidth: 200,
              );
            }
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}

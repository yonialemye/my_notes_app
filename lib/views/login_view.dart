import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/constants/routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          TextField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
          ),
          TextField(
            controller: password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: 'Enter your password',
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = this.email.text;
              final password = this.password.text;
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                Navigator.of(context).pushNamedAndRemoveUntil(notesRoute, (route) => false);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('user not found!');
                } else if (e.code == 'wrong-password') {
                  print('wrong password detected');
                }
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (route) => false);
            },
            child: const Text('Not registered yet? Register here.'),
          ),
        ],
      ),
    );
  }
}

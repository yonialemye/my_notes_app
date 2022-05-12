import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
    return Column(
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
              final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email,
                password: password,
              );
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('weak password is detected');
              } else if (e.code == 'email-already-in-use') {
                print('Email already used!');
              } else if (e.code == 'invalid-email') {
                print('Invalid email detected');
              }
            }
          },
          child: const Text('Register'),
        ),
      ],
    );
  }
}

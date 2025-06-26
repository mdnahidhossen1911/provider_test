import 'package:flutter/material.dart';
import 'package:provider_test/utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('login'),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, RoutesName.home);
            }, child: Text('move next')),
          ],
        ),
      ),
    );
  }
}

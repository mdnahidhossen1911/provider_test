import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/controller/login_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorSchemeSeed: Colors.blue),
        home: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Gmail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: password,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            Consumer<LoginController>(
              builder: (context, value, child) => value.inProgress == true
                  ? CircularProgressIndicator(color: Colors.blue)
                  : ElevatedButton(
                      onPressed: () {
                        String url = 'https://reqres.in/api/login';
                        Map<String, dynamic> data = {
                          "email": email.text.trim(),
                          "password": password.text.trim(),
                        };
                        loginController.login(url, data);
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: Size(double.maxFinite, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

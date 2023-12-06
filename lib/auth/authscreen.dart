import 'package:flutter/material.dart';
import 'package:tomyapp/auth/authform.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff31304D) ,
        title: Text('Authentication'),),
      body:AuthForm(),
    );
  }
}
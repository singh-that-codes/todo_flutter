import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tomyapp/auth/authscreen.dart';
import 'package:tomyapp/screens/home.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: //SignInScreen(),
      StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, usersnapshot) {
          return usersnapshot.hasData ? Home() : AuthScreen();
        },
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.purple),
    );
  }
}

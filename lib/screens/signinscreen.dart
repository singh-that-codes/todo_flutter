import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomyapp/auth/authform.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
        color: Color(0xff31304D),
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Image.asset('assets/TaskForge1.png'),
          Text(
            'Login / SignUp with',
            style:GoogleFonts.roboto(fontSize:22),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 30),
                width: 50,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    
                  },
                  child: Image.asset('assets/google.png'),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>AuthForm()),
                    );
                  },
                  child: Image.asset('assets/email.png'),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _username = '';
  bool isLoginPage = false;


  //------------------------------------------
  startAuthentication(){
    final validity = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(validity){
      _formKey.currentState?.save();
      submitForm(_email,_password,_username);
    }
  }
  submitForm(String email, String password, String username) async {
  final auth = FirebaseAuth.instance;
  UserCredential authResult;

  try {
    if (!isLoginPage) {
      authResult = await auth.signInWithEmailAndPassword(email: email, password: password);
    } else {
      authResult = await auth.createUserWithEmailAndPassword(email: email, password: password);
      String uid = authResult.user?.uid ?? ''; // Use an empty string if uid is null
      if (uid.isNotEmpty) {
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'username': username,
          'email': email,
        });
      } else {
        print('User UID is null or empty');
      }
    }
  } catch (err) {
    print(err);
  }
}
googleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      if (googleSignInAccount == null) return; // User canceled the sign-in process

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);

      // You can handle the signed-in user here, for example, store user details in Firestore
      User? user = authResult.user;
      print('Google Sign-In successful! User ID: ${user?.uid}');
    } catch (error) {
      print('Google Sign-In error: $error');
    }
  }

  //------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color(0xff161A30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(35),
              height:200,
              child: (Image.asset('assets/TaskForge1.png'))
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!isLoginPage)
                      TextFormField(
                        keyboardType: TextInputType.name,
                        key: ValueKey('username'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Incorrect username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _username = value!;
                        },
                        decoration: InputDecoration(
                          fillColor: Color(0xffB6BBC4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(),
                          ),
                          labelText: "Enter Username",
                          labelStyle: GoogleFonts.roboto(),
                        ),
                      ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      key: ValueKey('email'),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Incorrect Email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(),
                        ),
                        labelText: "Enter Email",
                        labelStyle: GoogleFonts.roboto(color:Color(0xffF0ECE5)),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      key: ValueKey('password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Incorrect password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(),
                        ),
                        labelText: "Enter Password",
                        labelStyle: GoogleFonts.roboto(color:Color(0xffF0ECE5)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          startAuthentication();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff31304D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: isLoginPage? Text('Login',style: GoogleFonts.roboto(fontSize: 16,color:Color(0xffF0ECE5)),):Text('Sign Up',style: GoogleFonts.roboto(fontSize: 16,color:Color(0xffF0ECE5)),),
                        ),
                      ),
                      
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateColor.resolveWith((states) => Color(0xffB6BBC4))
                        ),
                        onPressed: (){
                          setState(() {
                            isLoginPage = !isLoginPage;
                          });
                        },
                        child: isLoginPage?const Text('Not a member?',):const Text('Already a member ? Login!'),
                        ),
                      )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ElevatedButton.icon(
                onPressed: googleSignIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Customize the button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: Icon(Icons.g_mobiledata),
                label: Text('Sign in with Google'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
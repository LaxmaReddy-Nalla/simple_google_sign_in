import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SignUp(),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isloggedin = false;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  googleLogin() async {
    try {
      await googleSignIn.signIn();
      setState(() {
        isloggedin = true;
      });
    } catch (e) {
      print(e);
    }
  }

  googleLogout() {
    googleSignIn.signOut();
    setState(() {
      isloggedin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google_Sign_in'),
      ),
      body: Center(
          child: isloggedin
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 100.0,
                      backgroundImage:
                          NetworkImage(googleSignIn.currentUser.photoUrl),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      googleSignIn.currentUser.displayName,
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      googleSignIn.currentUser.email,
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      width: 150.0,
                      child: RaisedButton(
                        color: Colors.deepOrange[500],
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Text(
                          'Logout',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          googleLogout();
                        },
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        googleLogin();
                      },
                      icon: Image.asset('images/g_logo.png'),
                    ),
                    Text('Sign in with Google')
                  ],
                )),
    );
  }
}

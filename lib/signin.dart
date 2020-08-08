import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
loginGoogle() async {
  try {
    await googleSignIn.signIn();
  } catch (e) {
    print(e);
  }
}

logoutGoogle() {}

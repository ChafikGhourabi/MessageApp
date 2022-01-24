import 'package:flutter/material.dart';
import 'package:message_app/screen/chat_screen.dart';
import 'package:message_app/widgets/edit_text.dart';
import 'package:message_app/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInScreen extends StatefulWidget {
  static const String routeScreen = 'signin-screen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 180,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(height: 50),
              EditText(
                isPassword: false,
                hint: 'Enter your Email',
                onChange: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 8),
              EditText(
                isPassword: true,
                hint: 'Enter your Password',
                onChange: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 10),
              MyButton(
                color: Colors.yellow[900]!,
                title: 'Sign in',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (user != null) {
                      setState(() {
                        showSpinner = false;
                      });
                      Navigator.pushNamed(context, ChatScreen.routeScreen);
                    }
                  } catch (e) {
                    print(e);
                    print(email + '\n' + password);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:message_app/screen/chat_screen.dart';
import 'package:message_app/screen/register_screen.dart';
import 'package:message_app/screen/signin_screen.dart';
import 'screen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MessageMe app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: ChatScreen(),
      initialRoute: _auth.currentUser != null
          ? ChatScreen.routeScreen
          : WelcomeScreen.routeScreen,
      routes: {
        WelcomeScreen.routeScreen: (context) => WelcomeScreen(),
        SignInScreen.routeScreen: (context) => SignInScreen(),
        RegisterScreen.routeScreen: (context) => RegisterScreen(),
        ChatScreen.routeScreen: (context) => ChatScreen(),
      },
    );
  }
}

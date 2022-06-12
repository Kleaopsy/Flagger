import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flagger/screens/games.dart';
import 'package:flagger/screens/profile.dart';
import 'package:flagger/screens/settings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flagger/provider/googleSignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeClass.lightTheme,
        themeMode: ThemeMode.light,
        home: const Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: MainScreen(),
            ),
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: const AssetImage('assets/images/Logo.png'),
            width: screenWidth * 3 / 6,
          ),
          TextButton(
            onPressed: () => Navigator.push(context, CustomPageRoute(child: const Games())),
            child: Container(
              width: screenWidth - 30,
              height: 100,
              decoration: BoxDecoration(
                color: lightColorPalatte[1],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Play',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          const SignIn(),
          TextButton(
            onPressed: () => Navigator.push(context, CustomPageRoute(child: const Settings())),
            child: Container(
              width: screenWidth - 30,
              height: 100,
              decoration: BoxDecoration(
                color: lightColorPalatte[1],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () => exit(0),
            child: Container(
              width: screenWidth - 30,
              height: 100,
              decoration: BoxDecoration(
                color: lightColorPalatte[1],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Exit',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool notSigned = (FirebaseAuth.instance.currentUser == null) ? true : false;
    if (notSigned) {
      return TextButton(
        onPressed: () {
          final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
          setState(() => notSigned = provider.googleLogin() as bool);
        },
        child: Container(
          width: screenWidth - 30,
          height: 100,
          decoration: BoxDecoration(
            color: lightColorPalatte[1],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaIcon(FontAwesomeIcons.google, color: Colors.red),
                SizedBox(width: 10),
                Text(
                  'Sing Up with Google',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return TextButton(
        onPressed: () => Navigator.push(context, CustomPageRoute(child: const Profile())),
        child: Container(
          width: screenWidth - 30,
          height: 100,
          decoration: BoxDecoration(
            color: lightColorPalatte[1],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              'Profile',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flagger/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(const Profile());

List<Color> colorPalatte = getLightColorPalatte();

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profile'),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 20),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(user.photoURL!),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              const Text(
                                'Name:',
                                style: TextStyle(fontSize: 24, color: Colors.black, backgroundColor: Color.fromARGB(255, 236, 228, 179)),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                user.displayName!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                'Email:',
                                style: TextStyle(fontSize: 24, color: Colors.black, backgroundColor: Color.fromARGB(255, 236, 228, 179)),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                user.email!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                      decoration: BoxDecoration(color: colorPalatte[1], borderRadius: BorderRadius.circular(15)),
                    ),
                    const SizedBox(height: 200),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:instagram/responsive/mobile_screen_layout.dart';
// import 'package:instagram/responsive/responsive_layout.dart';
// import 'package:instagram/responsive/web_screen_layout.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/sign_up.dart';
import 'package:instagram/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const Responsive(mobileScreenLayout: mobileScreenLayout(), webScreenLayout: webScreenLayout(),),
      // home: SignupScreen(),
      home: LoginScreen(),
    );
  }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screens/homescreen/Home.dart';
// import 'package:instagram/responsive/mobile_screen_layout.dart';
// import 'package:instagram/responsive/responsive_layout.dart';
// import 'package:instagram/responsive/web_screen_layout.dart';
import 'package:instagram/screens/onboarding/login_screen.dart';
import 'package:instagram/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
FirebaseAuth _auth= FirebaseAuth.instance;
class MyApp extends StatelessWidget {
final _user= _auth.currentUser;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const Responsive(mobileScreenLayout: mobileScreenLayout(), webScreenLayout: webScreenLayout(),),
      // home: SignupScreen(),
      home: _user != null? HomeScreen():LoginScreen(),
    );
  }
}

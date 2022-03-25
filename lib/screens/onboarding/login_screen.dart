import 'package:flutter/material.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:instagram/screens/homescreen/Home.dart';
import 'package:instagram/screens/onboarding/sign_up.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/utils.dart';
import 'package:instagram/widgets/text_field_input.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var isLoading=false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
void loginUser()async{
  setState(() {
    isLoading=true;
  });
  String res= await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text);
  setState(() {
    isLoading=false;
  });
  if(res =="success"){
    //
    Get.to(HomeScreen());
   showSnackBar(res, context);
  
  }else{
    showSnackBar(res, context);
  }
}
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(child: Container(), flex: 2),
                    Text('Instagram',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)),
                    //logo
                    //     SvgPicture.asset('assets/instagram.svg',
                    //       color: primaryColor,
                    //       height: 64,
                    //     )
                    //emailtextfield
                    const SizedBox(height: 64),
                    TextFieldInput(
                        textEditingController: _emailController,
                        hintText: "Enter your email",
                        textInputType: TextInputType.emailAddress),
                    //passwordtextfield
                    const SizedBox(height: 24),
                    TextFieldInput(
                        textEditingController: _passwordController,
                        hintText: "Password",
                        textInputType: TextInputType.text,
                        isPass: true),
                    //btn
                    const SizedBox(height: 24),
                    InkWell(onTap: loginUser,
                      child: Container(
                        child: isLoading ? const Center(child: CircularProgressIndicator(color: primaryColor,),) : const Text('Login'),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          color: blueColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Flexible(child: Container(), flex: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: const Text('Dont have an account?'),
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            )),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Get.to(SignupScreen());
                          },
                          child: Container(
                              child: const Text(
                                'Sign up',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                              )),
                        )
                      ],
                    )
                  ]))),
    );
  }
}

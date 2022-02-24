import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/resources/auth_methods.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/utils.dart';
import 'package:instagram/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fileController = TextEditingController();
  Uint8List? _image;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    _fileController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState() {
      _image = im;
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
                    Text('Instagram'),
                    //logo
                    //     SvgPicture.asset('assets/instagram.svg',
                    //       color: primaryColor,
                    //       height: 64,
                    //     )
                    const SizedBox(height: 24),
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    'https://www.nicepng.com/png/detail/933-9332131_profile-picture-default-png.png'),
                              ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(Icons.add_a_photo),
                          ),
                        )
                      ],
                    ),
                    //emailtextfield
                    const SizedBox(height: 64),
                    TextFieldInput(
                        textEditingController: _usernameController,
                        hintText: "Enter your username",
                        textInputType: TextInputType.text),
                    const SizedBox(height: 24),
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
                    TextFieldInput(
                        textEditingController: _bioController,
                        hintText: "Enter your bio",
                        textInputType: TextInputType.text),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: () async {
                        String res = await AuthMethods().signUpUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                          username: _usernameController.text,
                          bio: _bioController.text,
                        );
                      },
                      child: Container(
                        child: const Text('Sign up'),
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
                          onTap: () {},
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

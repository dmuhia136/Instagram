import 'package:flutter/material.dart';
import 'package:instagram/utils/dimentions.dart';



    class Responsive extends StatelessWidget {
      final Widget webScreenLayout;
      final Widget mobileScreenLayout;
      const Responsive({Key? key, required this.webScreenLayout, required this.mobileScreenLayout}) : super(key: key);
    
      @override
      Widget build(BuildContext context) {
        return LayoutBuilder(builder: (context, constraints) {
        if(constraints.maxWidth > webScreenSize){
          return webScreenLayout;
        }
        return mobileScreenLayout;
        });
      }
    }
    